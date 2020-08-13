public class NGR_AccountCalloutResponseHandler {

    public final static integer SUCESS_STATUS = 200;
    
    public static NGR_EntityIdentifierVO parseJSON(string returnedJSON){
        try{
        return (NGR_EntityIdentifierVO)JSON.deserialize(returnedJSON,NGR_EntityIdentifierVO.class);            
        } catch(exception e){
            throw new AuraHandledException('Error: '+e.getMessage()+' Details: '+e.getCause()+' Line Number: '+e.getLineNumber() );
        }
    }
}