using { sap.capire.bookshop as my } from '../db/schema';

// service AdminService @(requires: 'authenticated-user'){
service AdminService {

    entity Books as projection on my.Books;
        annotate Books with @odata.draft.enabled;
        
    entity Authors as projection on my.Authors;
        annotate Authors with @odata.draft.enabled;
        
        

}