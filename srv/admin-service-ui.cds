using { AdminService } from './admin-service';

annotate AdminService.Books with {

    title       @title: 'Title';
    descr       @title: 'Description';
    author      @title: 'Author';
    genre       @title: 'Genre';
    stock       @title: 'Stock Available';
    price       @title: 'Price';

};

annotate AdminService.Authors with {

    ID @( 
        UI.Hidden,
        Common: {
            Text : name,
        }
    );
    name            @title : 'Author Name';
    dateOfBirth     @title : 'Date of Birth';
    dateOfDeath     @title : 'Date of Death';
    placeOfBirth    @title : 'Place of Birth';
    placeOfDeath    @title : 'Place of Death';
};

annotate AdminService.Genres with {
    ID @( 
        UI.Hidden,
        Common: {
            Text:   name
        }
    )
};


//Books page info

annotate AdminService.Books with @(

    UI: {

        //Selection fields general page
        SelectionFields  : [
            genre_ID,
            author_ID
        ],

        //Line item general page
        LineItem  : [
            
            {Value  :   title},
            {
                Value  :   author_ID,
                ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width: '30%'
                },    
            },
            {Value  :   stock},
            {Value  :   price},
            {
                Value: currency_code,
                Label:  ''
            }
            
        ],

        /**
         * Object Page Annotations
         */

          // Header Info Object Page
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Book',
            TypeNamePlural : 'Books',
            Title   :   {
                $Type   :   'UI.DataField',
                Value   :   title
            },
            Description : {
                $Type   : 'UI.DataField',
                Value   :  descr, 
            },
        },

         Facets  : [
             {
                 $Type: 'UI.ReferenceFacet', 
                 Label: 'Main Information', 
                 Target: ![@UI.FieldGroup#Main], 
             }
         ],

         FieldGroup #Main : {
             $Type : 'UI.FieldGroupType',
             Label: 'Main Information',
            Data : [
                
                {
                    $Type   :   'UI.DataField',
                    Value   :   author_ID,
                },
                {
                    $Type   :  'UI.DataField',
                    Value   :   stock
                },
                {
                    $Type   :   'UI.DataField',
                    Value   :   genre_ID,
                },
                {
                    $Type   :   'UI.DataField',
                    Value   :   price
                },
                {
                    Value   : currency_code,
                    Label   : 'Currency'
                }
                
            ],
         },
    }
);

annotate AdminService.Books with {
    author @( 
        Common: {
            Text : author.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues:   true,
            ValueList : {
                $Type : 'Common.ValueListType',
                Label   :   'Authors',
                CollectionPath : 'Authors',
                Parameters : [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        LocalDataProperty   :   author_ID,
                        ValueListProperty   :   'ID'
                    },
                    {
                        $Type   :   'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    }
                ]
            },
        }
    )
};

annotate AdminService.Books with {
    genre @( 
        Common: {
            Text: genre.name,
            TextArrangement : #TextOnly,
            ValueListWithFixedValues: true,
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Genres',
                Parameters: [
                    {
                        $Type   :   'Common.ValueListParameterInOut',
                        LocalDataProperty   :   genre_ID,
                        ValueListProperty   :   'ID'
                    },
                    {
                        $Type   :   'Common.ValueListParameterDisplayOnly',
                        ValueListProperty   :   'name'
                    }
                ]
            },
        }
    )
};

