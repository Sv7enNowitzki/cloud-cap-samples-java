using {my.bookshop as my} from '../db/index';

@path : 'payment'
service PaymentsUiService {
    @odata.draft.enabled
    entity Payments              as projection on my.Payments actions {
        action test();
    };
}