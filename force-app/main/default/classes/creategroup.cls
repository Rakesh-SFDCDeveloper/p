public class creategroup{
    Public void creatinggroup(){
//Create Group member
Group grp = new Group(); 
grp.Name = 'Testing'; 
grp.Type = 'Regular'; 
insert grp;

//Assign users to the group
List<GroupMember> Gplist = new List<GroupMember>();
for(User U : [Select Id from user where isActive = True AND Name like '%Rakesh%' LIMIT 1]) {
   GroupMember GrpMem = new GroupMember();
   GrpMem.GroupId = grp.Id;
   GrpMem.UserOrGroupId = U.Id;
   GpList.add(GrpMem);
}
if(!GpList.isEmpty()) {
        insert GpList;
}
    
    
    }
}