public class QuoteApprovalHistoryController {
    public String Quoteid {get;set;}
    public List<ProcessInstanceHistory> getApprovalSteps() {
      if (Quoteid != null) {
        Quote quote = [Select Id, (Select TargetObjectId, SystemModstamp,ProcessNode.Name, StepStatus, RemindersSent, ProcessInstanceId, OriginalActorId, IsPending, IsDeleted, Id, CreatedDate, CreatedById,Comments, ActorId From ProcessSteps order by SystemModstamp desc) from Quote where Id = :Quoteid];
                return quote.ProcessSteps;
      }
      return new List<ProcessInstanceHistory> ();
      
    }
    }