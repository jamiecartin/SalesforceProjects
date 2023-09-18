import System.Http;
import System.HttpRequest;
import System.HttpResponse;
import System.JSON;

public class HealthcareIntegration {
  //Method to make REST API call to third party app
  public static void makeAPIRequest(String endpoint, String requestBody) {
    //create HTTP instance
    Http http = new Http();

    //create HTTP Req
    HttpRequest request = new HttpRequest();
    request.setEndpoint(endpoint);
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json');
    request.setBody(requestBody);

    try {
      //Send HTTP Req
      HttpResponse response = http.send(request);

      //process response
      if (response.getStatusCode() == 200) {
        //Successful response
        String responseBody = response.getBody();
        //Process the responseBody as needed
      } else {
        System.debug('Exception: ' + ex.getMessage());
      }
    }

    //Method to integrate hms w/ third party app
    public static void integrateWithThirdPartyApp() {
      //prepare req body
      Map<String, Object> requestBodyMap = new Map<String, Object>();
      requestBodyMap.put('patientName', 'John Does');
      requestBodyMap.put('age', 35);
      requestBodyMap.put('gender', 'Male');
      //add extra data as needed

      //Convert req body to JSON
      String requestBody = JSON.serialize(requestBodyMap);

      //Make the API req to third party app
      makeAPIRequest('http://api.thirdpartyapp.com/endpoint', requestBody);
    }
  }






    
