using { sap.capire.bookshop as my } from '../db/schema';


service CatalogService @(path: '/catalog') {

    entity Books as select from my.Books {*,
        author.name as author,
        genre.name as genre}
        excluding {createdBy, modifiedBy};

    @requires: 'authenticated-user'
    action submitOrder (book: Books:ID, quantity: Integer);

}