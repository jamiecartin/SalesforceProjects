public class BillingIntegration {
  public static void createBillingAccount(String patientId) {
    //Logic to create billing account for the patient
    BillingAccount__c billingAccount = new BillingAccount__c();
    billingAccount.Patient__c = patientId;
    insert billingAccount;
}

  public static void updateBillingAccount(String patientId) {
    // logic to update billing account for patient
    BillingAccount__c billingAccount = [SELECT Id FROM BillingAccount__c WHERE Patient__c = :patientId];
    update billingAccount;
  }

  public static void deleteBillingAccount(String patientId) {
    //logic to delete billing account for patient
    BillingAccount__c billingAccount = [SELECT Id FROM BillingAccount__c WHERE Patient__c = :patientId];
    delete billingAccount;
  }
}
