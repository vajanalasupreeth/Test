/**
* Ruben's Demoware: Trigger as Platform Event subscriber
* Invokes World Bank API Async Service for each event
* Reference: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_queueing_jobs.htm
* 
* Author: Ruben Tungol
* Co-Author: Supreet
* */
trigger NGR_PlatformEventSubscriber on RT_Demo_Platform_Event__e (after insert) {
    List<NGR_WorkOrderVO> woList = new List<NGR_WorkOrderVO>();
  for (RT_Demo_Platform_Event__e anEvent : Trigger.New) {
        try{
        NGR_WorkOrderVO wo = new NGR_WorkOrderVO();
            wo.creationSequence  = anEvent.Creation_Sequence__c;
            wo.serivceAppointment = anEvent.Topic__c;
            wo.otherParts = anEvent.Details__c;
            wo.payment = anEvent.Payment__c ;
            wo.paymentSchedule = 'Test';
           woList.add(wo);
        }catch(exception e){
        anEvent.addError('Error: '+e.getMessage()+' Details: '+e.getCause()+' Line Number: '+e.getLineNumber());
    }
   }
   NGR_RequestBuilder.CreateRequest(woList);
}