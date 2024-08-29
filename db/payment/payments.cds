namespace sap.capire.payment.payments;

using {
  managed,
  cuid,
  sap
} from '@sap/cds/common';
using {sap.changelog as changelog} from '../../srv/target/cds/com.sap.cds/change-tracking';

extend Payments with changelog.changeTracked;

@title             : '{i18n>BusinessTransaction}'
@changelog:[displayId, name]
entity Payments : cuid {
    displayId                : String; //readable ID
    @changelog
    name                     : String;
};