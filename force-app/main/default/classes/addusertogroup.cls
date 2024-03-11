public class addusertogroup {
      Set<Id> setofuserlist=new Set<Id>();
    Public  void addingusertogroup(){
        List<Group> Grouplist=[select id from group where developername='My_Group' limit 1];
        List<user> userlist=[select id,Name from user  ];
        System.debug(userlist);
        
        
        List<Groupmember>  mygroupmember=new List<GroupMember>();
        for(User u:userlist){
         Groupmember gm=new Groupmember();
            gm.GroupId=Grouplist[0].Id;
            gm.UserOrGroupId=u.id;
            mygroupmember.add(gm);
                       
        }
      
        insert mygroupmember;
        
       
    } 
  }