using {sap.capire.payment.payments as payments} from './payment/Payments';
using {sap.capire.payment.payables as payables} from './payment/Payables';
using {sap.changelog as changelog} from '../srv/target/cds/com.sap.cds/change-tracking';

namespace sap.capire.businessTransactions;

entity BusinessTransactions          as(
    select from payments.Payments{
        key ID,
            displayId,
            name,
            changes
    }
)
union all
(
    select from payables.Payables {
        key ID,
            displayId,
            name,
            changes
    }
);