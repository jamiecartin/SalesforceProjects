trigger DeDupe on Lead (before insert, before update) {
  for (Lead myLead : Trigger.new) {
    if (myLead.Email != null) {
      List<Contact> dupes = [SELECT Id FROM Contact
                               WHERE Email = :myLead.Email];
      if (dupes.size() > 0) {
        myLead.Dupe_Contact__c = dupes[0].Id;
      } else {
        myLead.Dupe_Contact__c = null;
      }                             
    }
  }
}
