using BusinessTransactionsUiService as service from '../../srv/businesstransactions';

annotate service.BusinessTransactions with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'displayId',
            Value : displayId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
    ]
);
annotate service.BusinessTransactions with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'displayId',
                Value : displayId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type               : 'UI.ReferenceFacet',
            ID                  : 'ChangeHistoryFacet',
            Label               : '{i18n>ChangeHistory}',
            Target              : 'changes/@UI.PresentationVariant',
            ![@UI.PartOfPreview]: false
        }
    ]
);
