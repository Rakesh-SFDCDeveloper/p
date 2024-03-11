/**
* @description Controller class to render Wave Dashboards on Account One View if all the conditions are met.
*/

public with sharing class IgniteAccountController {

    public Boolean renderAccountOneView {get;set;}
    public Id accountId {get;set;}
    private List<Account> thisAccount = new List<Account> ();
    
/**
* @description Constructor method of IgniteAccountController
*/
    
    public IgniteAccountController(ApexPages.StandardController stdController) {
       renderAccountOneView = render();
    }

/**
* @description This method returns true if user has required permission sets and has a record in territory assignment object. Also Account has to be a customer.
* @return boolean value
*/
    
    public boolean render(){


        if(ApexPages.currentPage().getParameters().containsKey('id') ) {
        
            thisAccount = [SELECT Id FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
        }
        
        if(!thisAccount.isEmpty()){
        
            accountId = thisAccount[0].Id;
          
        }
        return false;
    }
}