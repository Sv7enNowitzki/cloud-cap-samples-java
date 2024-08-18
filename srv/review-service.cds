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

// annotate ReviewService.Reviews {
//   title @changelog;
// };

// annotate ReviewService.Reviews with @changelog: [book.email, book.phone];

annotate ReviewService.Reviews with {
   book @changelog: [book.email]
};
