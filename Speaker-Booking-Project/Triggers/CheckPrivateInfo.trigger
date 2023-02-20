trigger CheckPrivateInfo on Case (after insert, before update) {
	// Step 1: Create a collection containing each of our secret keywords
	Set<String> secretKeywords = new Set<String>();
	secretKeywords.add('Credit Card');
	secretKeywords.add('Social Security');
	secretKeywords.add('SSN');
	secretKeywords.add('Passport');

	// Step 2: Check to see if case has any of secret keywords
	List<Case> casesWithSecretInfo = new List<Case>();
	for (Case myCase : Trigger.new) {
		for (String keyword : secretKeywords) {
			if (myCase.Description != null && myCase.Description.containsIgnoreCase(keyword)) {
				casesWithSecretInfo.add(myCase);
				System.debug('Case ' + myCase.Id + ' include secret keyword ' + keyword);
				break;
			}

		}

	}

	// Step 3: If our case does contain secret word, create child case
	for (Case caseWithSecretInfo : casesWithSecretInfo) {
		Case childCase        = new Case();
		childCase.subject     = 'Warning: Parent case may contain secret info';
		childCase.ParentID    = caseWithSecretInfo.Id;
		childCase.IsEscalated = true;
		childCase.Priority    = 'High';
		childCase.Description = 'At least one of the following keywords were found ' + secretKeywords;
		insert childCase;
	}
}
