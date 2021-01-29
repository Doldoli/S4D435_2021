CLASS zcl_au_16_i_traveltp DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_auth_draft_active
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_lib_auth_draft_active~check_instance_authority
        REDEFINITION .
    METHODS /bobf/if_lib_auth_draft_active~check_static_authority
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_au_16_i_traveltp IMPLEMENTATION.




   METHOD /bobf/if_lib_auth_draft_active~check_instance_authority.
    DATA lv_activity TYPE activ_auth.

    IF is_ctx-activity = sc_activity-create.
      lv_activity = sc_activity-create.
    ELSEIF is_ctx-activity = sc_activity-change OR ( is_ctx-activity = sc_activity-execute AND is_ctx-action_name = zif_00_i_traveltp_c=>sc_action-z00_i_traveltp-set_to_cancelled ).
      lv_activity = sc_activity-change.
    ENDIF.

    DATA lt_travels TYPE zt00i_traveltp.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = lt_travels
        et_failed_key           = et_failed_key ).

    IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    CASE lv_activity.
      WHEN sc_activity-create.
        LOOP AT lt_travels REFERENCE INTO DATA(lr_travel).
          AUTHORITY-CHECK OBJECT 'S_AGENCY'
              ID 'AGENCYNUM' FIELD lr_travel->travelagency
              ID 'ACTVT' FIELD '01'.
          IF sy-subrc <> 0.
            et_failed_key = VALUE #( BASE et_failed_key ( key = lr_travel->key ) ).
          ENDIF.
        ENDLOOP.
      WHEN sc_activity-change.
        LOOP AT lt_travels REFERENCE INTO lr_travel.
          AUTHORITY-CHECK OBJECT 'S_AGENCY'
              ID 'AGENCYNUM' FIELD lr_travel->travelagency
              ID 'ACTVT' FIELD '02'.
          IF sy-subrc <> 0.
            et_failed_key = VALUE #( BASE et_failed_key ( key = lr_travel->key ) ).
          ENDIF.
        ENDLOOP.
    ENDCASE.

  ENDMETHOD.


  METHOD /bobf/if_lib_auth_draft_active~check_static_authority.
  ENDMETHOD.
ENDCLASS.
