@isTest
private class CheckPrivateInfoTest {
	
	@isTest static void createCaseWithSecretInfo() {
		Case myCase = new Case();
		myCase.Subject = 'Help!';
		myCase.Description = 'My SSN is : 0000000000';
		insert myCase;
		System.debug('Case ' + myCase.Id + ' created with description ' + myCase.Description);
	}
	
}
