using {
    Currency,
    managed,
    sap,
    cuid,
    sap.common.CodeList,
    Country
} from '@sap/cds/common';

context md {
    entity Participants  : managed, cuid  {
        @readonly lastName: String(80);
        @readonly firstName: String(80);
        score: Integer @Validation.Minimum : 0 @Validation.Maximum : 500;
    }
}
