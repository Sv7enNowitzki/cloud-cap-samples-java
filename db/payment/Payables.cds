using {
  managed,
  cuid,
  sap
} from '@sap/cds/common';

namespace sap.capire.payment.payables;

@title             : 'Payables'
entity Payables : cuid {
    displayId                : String; //readable ID
    name                     : String;
    cryptoAmount             : Decimal;
    fiatAmount               : Decimal; //Call reuse service to round due to allowed number of digits wherever necessary
};