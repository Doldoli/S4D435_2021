class ZCL_16_A_ISSUE_MESSAGE definition
  public
  inheriting from /BOBF/CL_LIB_A_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_ACTION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_16_A_ISSUE_MESSAGE IMPLEMENTATION.


  method /BOBF/IF_FRW_ACTION~EXECUTE.

  if eo_message is initial.
  eo_message = /BOBF/CL_FRW_MESSAGE_FACTORY=>CREATE_CONTAINER( ).
  endif.

  data(lo_message) = new zcm_16_travel( textid = zcm_16_travel=>ZCM_16_TRAVEL
                                    severity = zcm_16_travel=>CO_SEVERITY_SUCCESS ).
       eo_message->ADD_CM( lo_message ).
       ev_static_action_failed = abap_false.

  endmethod.
ENDCLASS.
