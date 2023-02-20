trigger Proposal on Contact (before insert) {
  List<Messaging.SingleEmailMessage> mails = 
  new List<Messaging.SingleEmailMessage>();
  
  for (Contact newContact : Trigger.new) {
    if (newContact.Email != null && newContact.FirstName != null) {
      Messaging.SingleEmailMessage mail = 
      new Messaging.SingleEmailMessage();
    
      List<String> sendTo = new List<String>();
      sendTo.add(myContact.Email);
      mail.setToAddresses(sendTo);
    
      mail.setReplyTo('xyz@abc.com');
      mail.setSenderDisplayName('Test');
    
      List<String> ccTo = new List<String>();
      ccTo.add('#');
      mail.setCcAddresses(ccTo);

      mail.setSubject('TestL');
      String body = 'Dear ' + newContact.FirstName + ', ';
      body += 'Test.';
      mail.setHtmlBody(body);
    
      mails.add(mail);
    }
  }
  Messaging.sendEmail(mails);
}
