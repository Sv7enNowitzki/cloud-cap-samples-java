using {sap.common.Languages as CommonLanguages} from '@sap/cds/common';
using {my.bookshop as my} from '../db/index';
using {sap.changelog as changelog} from 'com.sap.cds/change-tracking';

extend my.Orders with changelog.changeTracked;
extend my.Books with changelog.changeTracked;
extend my.OrderItems with changelog.changeTracked;
extend my.OrderItemsNote with changelog.changeTracked;

@path : 'admin'
service AdminService @(requires : 'admin') {
  entity Books   as projection on my.Books excluding { reviews } actions {
    action addToOrder(order_ID : UUID, quantity : Integer) returns Orders;
  }

  entity Authors as projection on my.Authors;
  entity Orders  as select from my.Orders;
  entity City    as projection on my.City;
  entity UnitOfMeasures    as projection on my.UnitOfMeasures;

  @cds.persistence.skip
  entity Upload @odata.singleton {
    csv : LargeBinary @Core.MediaType : 'text/csv';
  }
}

// Deep Search Items
annotate AdminService.Orders with @cds.search : {
  OrderNo,
  Items
};

annotate AdminService.OrderItems with @cds.search : {book};

annotate AdminService.Books with @cds.search : {
  descr,
  title
};

// Enable Fiori Draft for Orders
annotate AdminService.Orders with @odata.draft.enabled;
annotate AdminService.Books with @odata.draft.enabled;

// workaround to enable the value help for languages
// Necessary because auto exposure is currently not working
// for if Languages is only referenced by the generated
// _texts table
extend service AdminService with {
  entity Languages as projection on CommonLanguages;
}

annotate AdminService.Orders with @changelog: [
    unitOfMeasure.dimension.code,
    unitOfMeasure.dimension.name,
    Items.notes.content,
    city.country.name
] {
  OrderNo @changelog;
  Items @changelog:[Items.quantity, Items.notes.content];
  unitOfMeasure @changelog:[unitOfMeasure.name];
  city @changelog:[city.country.name, city.country.code];
};

annotate AdminService.OrderItemsNote with @changelog: [
    parent.parent.city.country.name,
    parent.parent.OrderNo,
    parent.quantity,
    content
] {
  content @changelog;
};

annotate AdminService.OrderItemsNote with @title: 'Order Items Note';
