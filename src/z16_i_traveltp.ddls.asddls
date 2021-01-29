@AbapCatalog.sqlViewName: 'Z16ITRAVELTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Travel Transactional View'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'Z16_V_TRAVEL',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'TravelNumber',
    semanticKey: ['TravelAgency', 'TravelNumber']
}



 

define view Z16_I_TravelTP
  as select from Z16_I_Travel

{   @ObjectModel.readOnly:true
  key TravelAgency,
  @ObjectModel.readOnly:true
   key TravelNumber,
      TravelDescription,
      @ObjectModel.mandatory: true
      Customer,
      @ObjectModel.mandatory: true
      StartDate,
      @ObjectModel.mandatory: true
      EndDate,
      @ObjectModel.readOnly: true
      Status,
      ChangedAt,
      ChangedBy
}
