using {
  managed,
  cuid,
  sap
} from '@sap/cds/common';

namespace sap.capire.payment.payments;

@title             : '{i18n>BusinessTransaction}'
entity Payments : cuid {
    displayId                : String; //readable ID
    name                     : String;
};