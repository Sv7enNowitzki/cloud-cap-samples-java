using {sap.capire.payment.payables as payables} from '../db/payment/Payables';
using {sap.changelog as changelog} from 'com.sap.cds/change-tracking';

extend payables.Payables with changelog.changeTracked;


service PayablesUiService {
    @odata.draft.enabled
    entity Payables              as projection on payables.Payables;
}

annotate PayablesUiService.Payables with @changelog: [
    displayId,
    name
] {
    name @changelog;
}