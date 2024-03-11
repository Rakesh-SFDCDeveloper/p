public class Leaddate {
    string newid='s3fd4s66a3sf4';
    Public void Leadlastmodified(){
       
       List<Lead> leadlist=[select Id,name from Lead where isconverted=True];
        System.debug(Leadlist);
         System.debug(Leadlist.size());
       if(!leadlist.isempty()){
           try{
           delete leadlist;
           }catch(exception e){
           System.debug('<<Exception>>###  '+e);
       }
           System.debug('Lead deleted');
    }
}
}