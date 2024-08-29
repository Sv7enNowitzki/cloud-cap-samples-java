using {sap.capire.payment.payments as payments} from '../db/payment/Payments';
// using {sap.changelog as changelog} from 'com.sap.cds/change-tracking';

// extend payments.Payments with changelog.changeTracked;

service PaymentsUiService {
    @odata.draft.enabled
    entity Payments as projection on payments.Payments
        actions {
            action test();
        };
}

// annotate PaymentsUiService.Payments with @changelog: [
//     displayId,
//     name
// ] {
//     name @changelog;
// }
