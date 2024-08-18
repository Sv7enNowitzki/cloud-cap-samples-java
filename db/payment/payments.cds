using {
  managed,
  cuid,
  sap
} from '@sap/cds/common';

namespace my.bookshop;

@title             : '{i18n>BusinessTransaction}'
@changelog: [displayId,name]

entity Payments : cuid {
    displayId                : String; //readable ID
    @changelog
    name                     : String;
};