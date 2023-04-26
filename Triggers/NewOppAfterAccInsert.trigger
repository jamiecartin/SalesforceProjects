trigger NewOppAfterAccInsert on Account (after insert) {
  List<Opportunity> opps = new List<Opportunity>();
  for (Account acc : Trigger.new) {
    Opportunity opp = new Opportunity;
    opp.Name = 'New Opportunity';
    opp.StageName = 'Prospecting';
    opp.CloseDate = Date.today).addDays(30);
    opp.AccountId = acc.Id;
    opps.add (opp);
   }
  insert opps;
}
