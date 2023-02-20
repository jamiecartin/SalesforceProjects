@RestResource(urlMapping='/v3/accounts/*')
global with sharing class AccountRESTService_V3 {

    @HttpGet
    global static AccountWrapper doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        AccountWrapper response = new AccountWrapper();
        
        String accountID = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        if(doSearch(accountId)) {
            searchAccounts(req, res, response);
        } else {
            findAccount(res, response, accountId);
        }
        return response;
    }
    
    private static boolean doSearch(String accountId) {
        if(accountId == 'accounts') {
            return true;
        }
        return false;
    }
    
    private static void searchAccounts(RestRequest req, RestResponse res, AccountWrapper response) {
        
        String searchTerm = req.params.get('Name');
    
    if(searchTerm == null || searchTerm == '') {
        response.status = 'Error';
        response.message = 'You must provide a name for your search';
        res.StatusCode = 400;
    } else {
        String searchText = '%'+searchTerm+'%';
        List<Account> searchResults = [SELECT Id, Name, Phone, Website FROM Account WHERE Name LIKE : searchText];
        
        if(searchResults != null && searchResults.size() > 0) {
            response.acctList = searchResults;
            response.status = 'Success';
            response.message = searchResults.size() + ' Accounts were found that matched your search term.';
        } else {
            response.status = 'Error';
            response.message = 'No Accounts were found with that name; please try again';
        }
    }
}

private static void findAccount(RestResponse res, AccountWrapper response, String accountId) {
    if(accountId != null && accountId != '') {
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id =: accountId];
        
        if(result != null && result.size() > 0) {
            response.acctList.add(result[0]);
            response.status = 'Success';
        } else {
            response.status = 'Error';
            response.message = 'This account could not be found.';
            res.StatusCode = 404;
        }
    }
    else {
        response.status = 'Error';
        response.message = 'You must specify an ID.';
        res.statusCode = 400;
    }
}

global class AccountWrapper {
    public List<Account> acctList;
    public String status;
    public String message;
    
    public AccountWrapper(){
        acctList = new List<Account>();
    }
}
}
