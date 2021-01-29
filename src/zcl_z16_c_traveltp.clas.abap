class ZCL_Z16_C_TRAVELTP definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_Z16_C_TRAVELTP IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~Z16_C_TRAVELTP| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20210128100210.
  endmethod.
ENDCLASS.
