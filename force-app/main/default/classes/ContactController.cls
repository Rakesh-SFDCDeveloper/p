public class ContactController {
@AuraEnabled
    Public static List<Contact> getcontacts(){
        
        List<Contact> contacts =[SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
//Add isAccessible() check
return contacts;
    }
}