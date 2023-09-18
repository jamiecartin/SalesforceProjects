import System.Http;
import System.HttpRequest;
import System.HttpResponse;
import System.JSON;

public class HealthcareIntegration {
  //Methof to make REST API call to third party app
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
