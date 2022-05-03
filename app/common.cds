/*
 Common Annotations shared by all apps
*/

using { sap.capire.bookshop as my } from '../db/schema';

annotate my.Books with {

    title       @title: 'Title';
    descr       @title: 'Description';
    author      @title: 'Author';
    genre       @title: 'Genre';
    stock       @title: 'Stock Available';
    price       @title: 'Price';

};

annotate my.Authors with {

    name            @title : 'Author Name';
    dateOfBirth     @title : 'Date of Birth';
    dateOfDeath     @title : 'Date of Death';
    placeOfBirth    @title : 'Place of Birth';
    placeOfDeath    @title : 'Place of Death';
};
