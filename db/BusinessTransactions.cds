using {my.bookshop as payments} from './payment/payments';
using {my.bookshop as payables} from './payment/Payables';


namespace my.bookshop;

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