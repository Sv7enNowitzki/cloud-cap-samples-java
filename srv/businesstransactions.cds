using {my.bookshop as my} from '../db/index';

@path : 'businesstransaction'
service BusinessTransactionsUiService {
    entity BusinessTransactions              as projection on my.BusinessTransactions;
}