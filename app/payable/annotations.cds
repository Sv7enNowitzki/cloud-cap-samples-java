using PayablesUiService as service from '../../srv/ui-service-payable';

annotate service.Payables with @(
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
        {
            $Type : 'UI.DataField',
            Label : 'cryptoAmount',
            Value : cryptoAmount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'fiatAmount',
            Value : fiatAmount,
        },
    ]
);
annotate service.Payables with @(
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
            {
                $Type : 'UI.DataField',
                Label : 'cryptoAmount',
                Value : cryptoAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'fiatAmount',
                Value : fiatAmount,
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
