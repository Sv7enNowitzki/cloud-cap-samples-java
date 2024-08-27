using {sap.capire.businessTransactions as bt} from '../db/BusinessTransactions';
using {sap.changelog as changelog} from 'com.sap.cds/change-tracking';

// extend bt.BusinessTransactions with changelog.changeTracked;
// using {sap.capire.payment.payments as payments} from '../db/payment/Payments';
// using {sap.capire.payment.payables as payables} from '../db/payment/Payables';

service BusinessTransactionsUiService {
    entity BusinessTransactions              as projection on bt.BusinessTransactions;
}