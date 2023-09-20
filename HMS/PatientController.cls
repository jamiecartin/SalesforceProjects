public class PatientController {
  public static void createPatient(String firstName, String lastName, String email, String phoneNumber) {
    Patient__c patient = new Patient__c();
    patient.FirstName__c = firstName;
    patient.LastName__c = lastName;
    patient.Email__c = email;
    patient.PhoneNumber__c = phoneNumber;
    insert patient;

    // Call billing integration method
  BillingIntegration.createBillingAccount(patient.Id);
  }

  public static void updatePatient(String patientId, String email, String phoneNumber) {
    Patient__c patient = [SELECT Id, Email__c, PhoneNumber__c FROM Patient__c WHERE Id = :patientId];
    patient.Email__c = email;
    patient.PhoneNumber__c = phoneNumber;
    update patient;

    // Call billing integration method

  BillingIntegration.updateBillingAccount(patient.Id);
  }
}

  
