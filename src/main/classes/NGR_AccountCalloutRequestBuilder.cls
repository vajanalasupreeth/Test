public class NGR_AccountCalloutRequestBuilder {
    
    public static NGR_EntityIdentifierVO doGetCallout(NGR_EntityIdentifierVO account_EntityIdentifier){
        try{
        string payload = JSON.serialize(account_EntityIdentifier);
        NGR_CallOut call = new NGR_CallOut();
        NGR_EntityIdentifierVO returnedValue = NGR_AccountCalloutResponseHandler.parseJSON(call.GetCallout('callout:Countries/'+ account_EntityIdentifier.guid +'?format=json',new map<string,string>{'content-type'=> 'text/xml'},payload));
        return returnedValue;
        } catch(exception e){
             throw new AuraHandledException('Error: '+e.getMessage()+' Details: '+e.getCause()+' Line Number: '+e.getLineNumber() );
        }    
    }

}