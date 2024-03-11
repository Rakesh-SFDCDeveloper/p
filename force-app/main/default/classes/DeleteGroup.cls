public class DeleteGroup {
    Public void deletinggroup(){
        Group g = [SELECT Id, Name, DeveloperName FROM Group 
           Where DeveloperName = 'My Group' LIMIT 1];
delete g;
        system.debug('<<delete group>>'+g);
    }
}