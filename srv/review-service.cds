using {my.bookshop as my} from '../db/index';

using {sap.changelog as changelog} from 'com.sap.cds/change-tracking';

extend my.Reviews with changelog.changeTracked;

@path : 'review'
service ReviewService {
    entity Reviews as projection on my.Reviews;

    @readonly
    entity Books   as projection on my.Books excluding {
        createdBy,
        modifiedBy
    }

    @readonly
    entity Authors as projection on my.Authors;

    // access control restrictions
    annotate Reviews with @restrict : [
        {
            grant : '*',
            to : 'authenticated-user',
            where : (createdBy=$user)
        },
        {
            grant : '*',
            to : 'admin',
        }
    ];
}

annotate ReviewService.Reviews with @odata.draft.enabled;

annotate ReviewService.Reviews with @changelog: [
    book.email,
    book.phone
] {
    title @changelog;
    book @changelog: [
        book.email,
        book.phone
    ]
};

// Object ID of Use Case 2: Annotate single field/multiple fields of project customized types as the Object ID
// annotate ReviewService.Reviews with @changelog: [
//     book.email,
//     book.phone
// ] {
//     title @changelog;
// }

// Trace changes of Use Case 2: Trace the changes of fields defined by project customized types and display the meaningful data
// annotate ReviewService.Reviews {
//     book @changelog: [book.email];
// }
