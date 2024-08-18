using {
  managed,
  cuid,
  sap
} from '@sap/cds/common';


namespace my.bookshop;

@title             : 'Payables'
@changelog: [displayId]

entity Payables : cuid {
    displayId                : String; //readable ID
    @changelog
    name                     : String;
    cryptoAmount             : Decimal;
    fiatAmount               : Decimal; //Call reuse service to round due to allowed number of digits wherever necessary
};