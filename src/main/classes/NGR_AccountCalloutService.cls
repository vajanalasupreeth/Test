/**
* can beInvocabed from  anywhere an Apex class can be invoked
* parameters : -- NGR_SystemUid, NGR_EntityIdentifier 
* Author: Supreet
*/
public class NGR_AccountCalloutService {
    
    //Second param optional
    public static void getAccountCallout(NGR_EntityIdentifierVO account_EntityIdentifier,NGR_SystemUidVO account_SystemUid){
        try {
        NGR_AccountCalloutRequestBuilder.doGetCallout(account_EntityIdentifier);
          } catch(exception e){
                throw new AuraHandledException('Error: '+e.getMessage()+' Details: '+e.getCause()+' Line Number: '+e.getLineNumber() );
            }
                  
    }
}