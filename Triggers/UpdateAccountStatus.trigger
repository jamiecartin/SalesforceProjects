trigger UpdateAccountStatus on Opportunity (after update) {
  Set<Id> accountlds = new Set<Id>();
  for (Opportunity opp : Trigger.new) {
    if (opp.StageName == 'Closed Won') {
      accountIds.add(opp.AccountId);
      }
   }
  List<Account> accountsToUpdate = [SELECT Id, Status__c FROM Account WHERE Id IN :accountIds];
  for (Account acc : accountsToUpdate) {
    acc.Status__c = 'Active';
  }
  update accountsToUpdate;
  }
