public class DeleteChildrec {
	
    @InvocableMethod
    public static void deletech(List<Project__c> parentId){
        
        List<People__C> ppl=[Select Id,name,R_k__Project__c from People__c where R_k__Project__c IN: parentId  ];
        delete ppl;	
    }
}