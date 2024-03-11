public without sharing class IgniteCampaignMemberLeadShareAdd implements Database.Batchable<sObject>{

    private static final String PUBLIC_GROUP_NAME = 'ZZZZCampaignMemberAccessTest';
    
   
    
    public Database.QueryLocator Start(Database.BatchableContext ctx) {
    
       
       
        String campaignMember = 'SELECT LeadId FROM CampaignMember WHERE CampaignId = \'701m0000000UFJ2\' AND ContactId = null';
        system.debug('*****campaignMember'+campaignMember);
        return Database.getQueryLocator(campaignMember);
        
    }
    
    public void Execute(Database.BatchableContext ctx, List<sObject> scope) {
        
        Set<Id> setLeadsIds = new Set<Id>();
        
        // Create Set of Lead Ids that are member of the Campaign
        for(sobject s : scope) {
            // Add Lead Ids returned by the query to the Set of Lead Ids.
            CampaignMember cm = (CampaignMember) s;
            Id leadId = (Id) cm.LeadId;
            setLeadsIds.add(leadId); 
        }
        
        Set<Id> setLeadsAlreadyShared = new Set<Id>();

        if(!setLeadsIds.isEmpty()){
            for (LeadShare leadId : [SELECT LeadId FROM LeadShare WHERE UserOrGroupId  = '00Gm0000001cZ59'and LeadID in :setLeadsIds]) {
                Id sharedLeadId = (Id) leadId.LeadId;
                setLeadsAlreadyShared.add(sharedLeadId);
            }
        }    
        system.debug('*****setLeadsAlreadyShared'+setLeadsAlreadyShared);
       Set<Id> setLeadsToBeShared = new Set<Id>();
       setLeadsToBeShared.addAll(setLeadsIds);
       setLeadsToBeShared.removeAll(setLeadsAlreadyShared);
       system.debug('*****setLeadsToBeShared'+setLeadsToBeShared);
       List<LeadShare> listLeadsToBeShared = new List<LeadShare>();
       
       if (!setLeadsToBeShared.isEmpty())  {
       
           for(Id leadIdToBeShared : setLeadsToBeShared){
                LeadShare leadShare = new LeadShare();
                leadShare.LeadId = leadIdToBeShared;
                leadShare.UserOrGroupId = '00Gm0000001cZ59';
                LeadShare.LeadAccessLevel = 'Read';
                listLeadsToBeShared.add(LeadShare);   
           } 
        }
         system.debug('*****listLeadsToBeShared'+listLeadsToBeShared);
        if(!listLeadsToBeShared.IsEmpty()){
                database.insert(listLeadsToBeShared);
                system.debug('*RECORD INSERTED********'+listLeadsToBeShared);
        } 

    }
    
    public void Finish(Database.BatchableContext ctx) {

          
    }

}