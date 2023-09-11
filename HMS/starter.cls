public class Patient__c {
  public String Name { get; set; }
  public Date Birthdate { get; set; }
  public String Gender { get; set; }
}

public void createPatient(String name, Date birthdate, String gender) {
  Patient__c newPatient = new Patient__c();
  newPatient.Name = name;
  newPatient.Birthdate = birthdate;
  newPatient.Gender = gender;
  insert newPatient;
}

public List<Patient__c>
getPatientsByCondition(String condition) {
  List<Patient__c> patients = [SELECT Name, Birthdate, Gender FROM Patient__c WHERE Condition__c = :condition];
  return patients;
}

public void updatePatient(String patientId, String newName, Date newBirthdate, String newGender) {
  Patient__c patientToUpdate = [SELECT Id, Name, Birthdate, Gender FROM Patient__c WHERE Id = :patientId];
  patientToUpdate.Name = newName;
  patientToUpdate.Birthdate = newBirthdate;
  patientToUpdate.Gender = newGender;
  update patientToUpdate;
}

public void deletePatient(String patientId) {
  Patient__c patientToDelete = [SELECT Id FROM Patient__c WHERE Id = :patientId];
  delete patientToDelete;
}
