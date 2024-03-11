Public class Accounthelper{
	Public void Accountshare(){
	List<Account> accnts=[select Id,name from Account];
	if(!accnts.isEmpty()){
	for(Account acc : accnts){
	System.debug(Accnts);
		}	
	  }
    }
}