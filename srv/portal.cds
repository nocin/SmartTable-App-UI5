using {md} from '../db/schema';


service TestEndpoint @(path : '/testendpoint') {
    @Capabilities : { Updatable: true, Insertable: false }
    @Capabilities.UpdateRestrictions: {Updatable:true}  
    entity Participants as projection on md.Participants {*,score @sap.updatable};
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
        Value: lastName,
        Label : '{i18n>lastName}' 
    },
            {
        Value: score,
        Label : '{i18n>score}' 
    }
    ]
});

annotate TestEndpoint.ExamParticipants with @odata.draft.enabled;