public class Updatefield {   
    
    public static void updatefield(string accs){
        List<Contact> contacts=new List<Contact>();
        list<contact> contacts1=[Select Id,name from contact where AccountId=:accs];
        System.debug('acc'+contacts1);
        for(Contact con : contacts1){
     	contacts.add(con);           
        }     
        for(Integer i=0;i<contacts.size();i++){
            contact con1=new contact();
            con1.Id=contacts[i].id;
            if(con1.R_k__Level__c=='Primary'){
           con1.Description='Updated Today and level is primary'+date.today();
            }
             if(con1.R_k__Level__c!='Primary'){
           con1.Description='Updated Today and level updated to higher level '+date.today();
            }
            
       update con1;
        }
    }
}