public class NametriggerHandler {

    Public static void updatelasetname(List<Account> listofaccounts){
        for(Account Acc : listofaccounts ){
            if(Acc.phone==NULL){
                Acc.Description='Have no acc.phone nmber';
            }
            }
        for(Account Acc2 : listofaccounts){
            if(Acc2.phone!=NULL){
                
                Acc2.Name=Acc2.Name+'  Have Phone number';
            }
        }
        }
    }