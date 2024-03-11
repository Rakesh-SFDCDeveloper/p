@isTest
private class OrderItemTrigger_Test{
  @testSetup
  static void setupTestData(){
      Test.startTest();
        Account Acc=new Account();
       Acc.Name='Test Dealer Account 5';
       Acc.BillingCity='BROOKFIELD';
      Acc.Phone='5468133543';
        Acc.BillingCountry='United States';
        
        insert Acc;

    Order order_Obj = new Order(AccountId=acc.Id, EffectiveDate = Date.today(), IsReductionOrder = false, Status = 'Draft');
    Insert order_Obj; 
          Product2 p = new Product2();
    p.Name = ' Test Product ';
    p.Description='Test Product Entry 1';
    p.productCode = 'ABC';
    p.isActive = true;
    insert p;
       
    
    PricebookEntry standardPrice = new PricebookEntry();
    standardPrice.Pricebook2Id = '01s7F00000I06Gh';
    standardPrice.Product2Id = p.Id;
    standardPrice.UnitPrice = 1;
    standardPrice.IsActive = true;
    standardPrice.UseStandardPrice = false;
    insert standardPrice ;
    Product2 product2_Obj = new Product2(Name = 'Name840', ProductCode = 'Produ612', IsActive = true);
    Insert product2_Obj; 

  }
  static testMethod void test_OrderItemTrigger(){
   
    List<Order> order_Obj  =  [SELECT Id,EffectiveDate,IsReductionOrder,Status from Order];
    System.assertEquals(1,order_Obj.size());
    List<Product2> product2_Obj  =  [SELECT Id,Name,ProductCode,IsActive from Product2];
    System.assertEquals(1,product2_Obj.size());
    OrderItem orderitem_Obj = new OrderItem(Product2Id = product2_Obj[0].id, OrderId = order_Obj[0].id,PricebookEntryId='test', Quantity = 8, UnitPrice = 9, R_k__Parent_Identifier__c = 'R_k__804', R_k__ProductHierarchyPath__c = 'R_k__592', R_k__Offer_Id__c = 'R_k__554');
    Insert orderitem_Obj; 
   test.stopTest();
  }
}