using {my.bookshop as my} from '../db/index';

@path : 'payable'
service PayablesUiService {
    @odata.draft.enabled
    entity Payables              as projection on my.Payables;
}