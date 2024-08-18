using PaymentsUiService as service from '../../srv/payment';

annotate service.Payments with @(
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
annotate service.Payments with @(
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
        }
    ]
);
