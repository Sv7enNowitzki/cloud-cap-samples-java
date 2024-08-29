using {sap.capire.businessTransactions as bt} from '../db/BusinessTransactions';

service BusinessTransactionsUiService {
    entity BusinessTransactions              as projection on bt.BusinessTransactions;
}