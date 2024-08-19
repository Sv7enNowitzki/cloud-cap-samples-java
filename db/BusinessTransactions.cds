namespace my.bookshop;

// using {my.bookshop as my} from '../db/index';
using {my.bookshop as payments} from './payment/payments';
using {my.bookshop as payables} from './payment/Payables';
using {sap.changelog as changelog} from '../srv/target/cds/com.sap.cds/change-tracking';

// extend payments.Payments with changelog.changeTracked;
// extend payables.Payables with changelog.changeTracked;

entity BusinessTransactions          as(
    select from payments.Payments{
        key ID,
            displayId,
            name
    }
)
union all
(
    select from payables.Payables {
        key ID,
            displayId,
            name
    }
);