namespace my.bookshop;

using {
    Currency,
    User,
    managed,
    cuid
} from '@sap/cds/common';
using my.bookshop.Books from './books';

entity Orders : cuid, managed {
    OrderNo  : String @title : '{i18n>OrderNumber}'  @mandatory; //> readable key
    Items    : Composition of many OrderItems
                   on Items.parent = $self;
    buyer    : User;
    total    : Decimal(9, 2)@readonly;
    currency : Currency;
    city     : Association to one City;
    @UI.HiddenFilter : true
    unitOfMeasure : Association to UnitOfMeasures;
}

entity UnitOfMeasures {
        //code as a key,need to be refactored after MES
    key code : String(3);
        name : localized String(10);
        description : localized String(30);
        isoCode : String(3);
        dimension : Association to UnitOfMeasuresDimensions;
        //uuid is not a key here,need to be refactored after MES
        uuid : String(36);
}

entity UnitOfMeasuresDimensions : cuid {
    code : String(6);
    name : localized String(20);
}

// @title : 'Order Items'
entity OrderItems : cuid {
    parent    : Association to Orders;
    book      : Association to Books @mandatory @assert.target;
    notes    : Composition of many OrderItemsNote
                   on notes.parent = $self; 
    quantity    : Integer;
    amount : Decimal(9, 2);
}

entity OrderItemsNote : cuid {
  parent    : Association to one OrderItems;
  content   : String;
}

entity City : cuid {
  name    : String;
  country : Association to one Country;
}

entity Country : cuid {
  name : String;
  code : String;
}
