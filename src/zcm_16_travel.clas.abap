class ZCM_16_TRAVEL definition
  public
  inheriting from /BOBF/CM_FRW
  final
  create public .

public section.

constants:
             BEGIN OF zcm_16_travel,
        msgid TYPE symsgid VALUE 'DEVS4D435',
        msgno TYPE symsgno VALUE '100',
        attr1 TYPE scx_attrname VALUE 'attr1',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF zcm_16_travel.



  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !SEVERITY type TY_MESSAGE_SEVERITY optional
      !SYMPTOM type TY_MESSAGE_SYMPTOM optional
      !LIFETIME type TY_MESSAGE_LIFETIME default CO_LIFETIME_TRANSITION
      !MS_ORIGIN_LOCATION type /BOBF/S_FRW_LOCATION optional
      !MT_ENVIRONMENT_LOCATION type /BOBF/T_FRW_LOCATION optional
      !MV_ACT_KEY type /BOBF/ACT_KEY optional
      !MV_ASSOC_KEY type /BOBF/OBM_ASSOC_KEY optional
      !MV_BOPF_LOCATION type /BOBF/CONF_KEY optional
      !MV_DET_KEY type /BOBF/DET_KEY optional
      !MV_QUERY_KEY type /BOBF/OBM_QUERY_KEY optional
      !MV_VAL_KEY type /BOBF/VAL_KEY optional .
protected section.
private section.
ENDCLASS.



CLASS ZCM_16_TRAVEL IMPLEMENTATION.


  method CONSTRUCTOR ##ADT_SUPPRESS_GENERATION.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
SEVERITY = SEVERITY
SYMPTOM = SYMPTOM
LIFETIME = LIFETIME
MS_ORIGIN_LOCATION = MS_ORIGIN_LOCATION
MT_ENVIRONMENT_LOCATION = MT_ENVIRONMENT_LOCATION
MV_ACT_KEY = MV_ACT_KEY
MV_ASSOC_KEY = MV_ASSOC_KEY
MV_BOPF_LOCATION = MV_BOPF_LOCATION
MV_DET_KEY = MV_DET_KEY
MV_QUERY_KEY = MV_QUERY_KEY
MV_VAL_KEY = MV_VAL_KEY
.
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.
