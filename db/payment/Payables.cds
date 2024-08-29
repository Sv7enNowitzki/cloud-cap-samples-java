namespace sap.capire.payment.payables;

using {
  managed,
  cuid,
  sap
} from '@sap/cds/common';
using {sap.changelog as changelog} from '../../srv/target/cds/com.sap.cds/change-tracking';

extend Payables with changelog.changeTracked;

@title             : 'Payables'
@changelog:[displayId, name]
entity Payables : cuid {
    displayId                : String; //readable ID
    @changelog
    name                     : String;
    cryptoAmount             : Decimal;
    fiatAmount               : Decimal; //Call reuse service to round due to allowed number of digits wherever necessary
};