class ZCL_16_D_TRAVELAGENCY definition
  public
  inheriting from /BOBF/CL_LIB_D_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_DETERMINATION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_16_D_TRAVELAGENCY IMPLEMENTATION.


  method /BOBF/IF_FRW_DETERMINATION~EXECUTE.


      DATA lt_travels TYPE zt00i_traveltp.

    io_read->retrieve(
      EXPORTING
        iv_node                 = is_ctx-node_key
        it_key                  = it_key
      IMPORTING
        eo_message              = eo_message
        et_data                 = lt_travels
        et_failed_key           = et_failed_key ).

    LOOP AT lt_travels REFERENCE INTO DATA(lr_travel).
      lr_travel->travelagency = cl_s4d435_model=>get_agency_by_user( ).
      io_modify->update(
        EXPORTING
          iv_node           = is_ctx-node_key
          iv_key            = lr_travel->key
          is_data           = lr_travel
*           it_changed_fields =
        ).
    ENDLOOP.
  endmethod.
ENDCLASS.
