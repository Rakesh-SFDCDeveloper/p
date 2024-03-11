public class Userprovision {
     public static  Set<Id> setofuserid=new Set<Id>();
     public static Set<Id> setOfTerritryAssigneUserIds=new set<Id>();
     public static set<ID> userlicenseid=new set<ID>();
	 public static Map<String,Id> mapOfPermissionsetIdAndName = new Map<String,Id>(); 
     Set<Id> setOfUserIdsNotInGroup = new Set<Id>();
    
    Public  void Userprovisioning(){
         Map<Id,Id> mapOfUserIdGrpmemberId = new Map<Id,Id>();
        Set<Id> setOfIdsNotInTheGroup=new set<Id>();
        List<User> userlist=[select id,isactive from user where isactive=true and User.Profile.UserLicense.Name='salesforce' ];
        If(!userlist.isEmpty()){
            for(user u : userlist){
                setofuserid.add(u.id);
            }
          }
        List<GroupMember> groupmemberlist=[select id,userorgroupid from GroupMember where group.developername='My_Group'];
        If(!groupmemberlist.isEmpty()){
            for(Groupmember gm :groupmemberlist ){
               mapOfUserIdGrpmemberId.put(gm.userorgroupid,gm.id);
         }
            for(Id userid :setofuserid )     {
               if(mapOfUserIdGrpmemberId!=null && mapOfUserIdGrpmemberId.size()>0 && mapOfUserIdGrpmemberId.get(userId)==null)
                setOfUserIdsNotInGroup.add(userid);
            }
            
            
     
        List<GroupMember> listGroupMembers = new List<GroupMember>();
        List<Group> listGroup = [select id from Group where developername='My_Group' limit 1];
        if(!setOfUserIdsNotInGroup.isempty() && listGroup!=null){
            for(Id userid : setOfUserIdsNotInGroup){
                GroupMember awsOneViewUserMember = new GroupMember();
                awsOneViewUserMember.GroupId = listGroup[0].id;
                awsOneViewUserMember.UserOrGroupId = userid;
                listGroupMembers.add(awsOneViewUserMember );
            }   
       	 } 
            if(!listGroupMembers.isempty()){
            insert listGroupMembers;
        }
       }
     }
    }