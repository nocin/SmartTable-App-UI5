using {md} from '../db/schema';


service TestEndpoint @(path : '/testendpoint') {
    @Capabilities : { Updatable: true, Insertable: false }
    @Capabilities.UpdateRestrictions: {Updatable:true}  
    entity Participants as projection on md.Participants {
        @readonly ID, 
        email,
        lastName,
        @readonly firstName,
        score};
}

annotate TestEndpoint.Participants with @(UI : {
    Identification  : [{Value : ID}],
    SelectionFields : [],
    LineItem        : [
    {
        Value: ID,
        Label : '{i18n>ID}'
    },
        {
        Value: firstName,
        Label : '{i18n>firstName}' 
    },
            {
        Value: lastName
    },
            {
        Value: score,
        Label : '{i18n>score}' 
    }
    ]
});
annotate TestEndpoint.Participants {
  lastName      @sap.updatable:false ;
  lastName      @Common.FieldControl: 1; //#ReadOnly;
  firstName     @sap.updatable:false @readonly;
  lastName      @sap.creatable:false ;
  lastName      @sap.label:'Last name Dummy' ;
  ID            @sap.updatable:false;
}

// annotate TestEndpoint.ExamParticipants with @odata.draft.enabled;