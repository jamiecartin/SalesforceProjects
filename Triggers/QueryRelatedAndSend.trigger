trigger QueryRelatedAndSend on Opportunity (before insert, before update) {
  Map<Id, Account> accounts = new Map<Id, Account>(
    [SELECT Id, Name, (SELECT Id, Name, Email FROM Contacts) 
    FROM Account WHERE Id IN 
    (SELECT AccountId FROM Opportunity WHERE Id IN : Trigger.new)]
    );
    
    for (Opportunity opp : Trigger.new) {
      if (accounts.containsKey(opp.AccountId)) {
        Account account = accounts.get(opp.AccountId);
        
        for (Contact contact : account.Contacts) {
          if (contact.Email != null) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{contact.Email});
            email.setSubject('New Opportunity for ' + account.Name);
            email.setPlainTextBody('A new opportunity had been created for ' + account.Name + '.');
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
          }
        }
     }
  }
}
