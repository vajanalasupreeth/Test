trigger NGR_WorkOrderTrigger on WorkOrderValue__c (after insert,after update) {
    
 
      List<RT_Demo_Platform_Event__e> eventList = new List<RT_Demo_Platform_Event__e>();
    for(WorkOrderValue__c wov : trigger.new){
        
        try{
       RT_Demo_Platform_Event__e anEvent = new RT_Demo_Platform_Event__e (Topic__c =wov.Name , Details__c = wov.Service_Appointment__c ,  Payment__c  = wov.Payment__c ); 
       eventList.add(anEvent);
            }catch(exception e){
        wov.addError('Error: '+e.getMessage()+' Details: '+e.getCause()+' Line Number: '+e.getLineNumber());
    }
  }
   
        List<Database.SaveResult> results = EventBus.publish(eventList);
        Integer i = 1;
        for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                System.debug('Publish Result '  + i++ + '. Id: ' + sr.getId() + ',  Success? ' + sr.isSuccess() 
                             + ', Result Details: ' + sr);
            } else { 
                for(Database.Error err : sr.getErrors()) {
                    System.debug('!!! Publish Error. Status Code: ' + err.getStatusCode() 
                                 + ', Message: ' + err.getMessage());
                }
            }       
        } 
    
               

}