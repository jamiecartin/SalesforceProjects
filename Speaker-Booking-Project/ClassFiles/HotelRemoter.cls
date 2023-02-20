global with sharing class HotelRemoter 
{
	@RemoteAction
    	global static List<Hotel__c> findAll()
        {
            return [SELECT id, name, Location__Latitude__s, Location__Longitude__s FROM Hotel__c];
        }
}
