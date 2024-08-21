using {my.bookshop as my} from '../db/index';
using {sap.changelog as changelog} from 'com.sap.cds/change-tracking';
// extend my.Payments with changelog.changeTracked;
// extend my.Payables with changelog.changeTracked;
// extend my.BusinessTransactions with changelog.changeTracked;

@path: 'businesstransaction'
service BusinessTransactionsUiService {
    entity BusinessTransactions as projection on my.BusinessTransactions;
    entity Payments             as projection on my.Payments;
    entity Payables             as projection on my.Payables;
}