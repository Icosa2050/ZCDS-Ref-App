CLASS zcl_select_chap02 DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_select_chap02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*&---------------------------------------------------------------------*
*& Report ZTEST_CDS_SQL_SELECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

*####################################################################

    SELECT *
      FROM zsalesorder
      INTO TABLE @DATA(lt_zsalesorder2).

    out->write( 'salesorder' ).
    out->write( lt_zsalesorder2 ).
*####################################################################

    SELECT *
      FROM zi_salesorganization
      INTO TABLE @DATA(lt_zi_salesorganization2).

    out->write( 'salesorganization' ).
    out->write( lt_zi_salesorganization2 ).
*
*####################################################################

    SELECT SINGLE *
      FROM z_viewwithsearchsupport
      WHERE salesorderitem LIKE '%1'
    INTO @DATA(ls_z_viewwithsearchsupport).

*####################################################################

    SELECT \_product-product            AS product,
           \_product-producttype        AS producttype,
"           \_product-authorizationgroup AS authorizationgroup,
           \_product-creationdatetime   AS creationdatetime
       FROM zi_salesorderitem
       WHERE zi_salesorderitem~salesorder = 'S1'
         AND \_product-product IS NOT NULL
       INTO TABLE @DATA(lt_zi_product).

*####################################################################

    SELECT \_text-language
      FROM zi_product
      INTO TABLE @DATA(lt_result3) ##ASSOC_TO_N_OK[_TEXT].

*####################################################################

    SELECT \_salesorder-salesordertype,
           \_salesorderitem\_product\_text[ (1) INNER :
                                             WHERE language = 'E' ]-productname
       FROM zi_salesorderscheduleline
       WHERE \_salesorderitem\_product-producttype EQ 'FERT'
       INTO TABLE @DATA(lt_result2).

    out->write( 'PRODUCTS WITH E AND FERT' ).
    out->write( lt_result2 ).

*####################################################################

    SELECT \_salesorder-salesordertype,
           \_salesorderitem\_product\_text[ (1) LEFT OUTER : WHERE language = @sy-langu ]-productname
       FROM zi_salesorderscheduleline
       WHERE \_salesorderitem\_product-producttype EQ 'FERT'
       INTO TABLE @DATA(lt_result2b).
    out->write( 'PRODUCTS WITH language sy-langu AND FERT' ).
    out->write( lt_result2b ).


*####################################################################

    SELECT *
      FROM z_viewwithoptionalparameters
      INTO TABLE @DATA(lt_z_viewwithoptionalparams).

*####################################################################

    data(lv_current_date) = cl_abap_context_info=>get_system_date( ).

    SELECT *
      FROM z_viewwithoptionalparameters( p_keydate = @lv_current_date )
      INTO TABLE @DATA(lt_z_viewwithoptionalparamete2).

*####################################################################

    SELECT *
      FROM z_viewwithoptionalparameters( p_keydate = @lv_current_date )
      INTO TABLE @DATA(lt_z_viewwithoptionalparamete3).

*####################################################################

    SELECT *
      FROM z_viewwithparameters( p_keydate = @lv_current_date, p_language = 'E' )
      INTO TABLE @DATA(lt_z_viewwithparameter).

*####################################################################

    SELECT *
       FROM zi_salesorder
       INTO TABLE @DATA(lt_view_a).

*####################################################################

    SELECT *
       FROM zi_salesorderitem
       INTO TABLE @DATA(lt_view_c).

*####################################################################

    SELECT zi_salesorderitem~salesorderitem,
           \_salesorder-salesordertype
       FROM zi_salesorderitem
       INTO TABLE @DATA(lt_fields_of_views_c_and_d).

*####################################################################

    SELECT zi_salesorder~salesordertype
       FROM zi_salesorderitem
       INNER JOIN zi_salesorder
         ON zi_salesorderitem~salesorder = zi_salesorder~salesorder
       INTO TABLE @DATA(lt_field_of_view_b).

*####################################################################

    SELECT DISTINCT salesordertype
      FROM zi_salesorder
      INTO TABLE @DATA(lt_sales_order_type).

*####################################################################

    SELECT *
      FROM zc_salesorderwithuserinput( p_userinput = 'TAF' )
      INTO TABLE @DATA(lt_sales_order_with_user_input).

*####################################################################


    SELECT *
       FROM zc_salesorderprivilegedonly
       INTO TABLE @DATA(lt_zc_salesorderprivilegedonly).

    SELECT *
       FROM zc_salesorderprivilegedonly
       WITH PRIVILEGED ACCESS
       INTO TABLE @DATA(lt_zc_salesorderprivilegdonly2).

    SELECT *
       FROM zc_salesorderprivilegedonly
       INTO TABLE @DATA(lt_zc_salesorderprivilegdonly3)
       PRIVILEGED ACCESS.

*SELECT zc_slsordprivilegedonlysource~salesorder,
*       \_salesorderprivilegedonly-salesorder AS salesorder2,
*       target1~salesorder AS salesorder3,
*       target2~salesorder AS salesorder4
*  FROM zc_slsordprivilegedonlysource
*  LEFT OUTER JOIN zc_salesorderprivilegedonly AS target1
*    ON target1~salesorder = zc_slsordprivilegedonlysource~salesorder
*  LEFT OUTER JOIN zc_salesorderprivilegedonly WITH PRIVILEGED ACCESS AS target2
*    ON target2~salesorder = zc_slsordprivilegedonlysource~salesorder
*  INTO TABLE @DATA(lt_zc_slsordprivilegedonlysrc).
*
*SELECT zc_slsordprivilegedonlysource~salesorder,
*       \_salesorderprivilegedonly-salesorder AS salesorder2,
*       target1~salesorder AS salesorder3,
*       target2~salesorder AS salesorder4
*  FROM zc_slsordprivilegedonlysource
*  LEFT OUTER JOIN zc_salesorderprivilegedonly AS target1
*    ON target1~salesorder = zc_slsordprivilegedonlysource~salesorder
*  LEFT OUTER JOIN zc_salesorderprivilegedonly AS target2
*    ON target2~salesorder = zc_slsordprivilegedonlysource~salesorder
*  INTO TABLE @DATA(lt_zc_slsordprivilegedonlysrc2)
*  PRIVILEGED ACCESS.

*WITH +cte_assoc AS ( SELECT *
*                       FROM zc_slsordprivilegedonlysource
*                    )
*                    WITH ASSOCIATIONS (
*                      zc_slsordprivilegedonlysource~\_salesorderprivilegedonly
*                    )
*SELECT +cte_assoc~salesorder,
*       +cte_assoc~\_salesorderprivilegedonly-salesorder AS salesorder2
*  FROM  +cte_assoc
*  INTO TABLE @DATA(lt_zc_slsordprivilegedonlysrc3).
*
*WITH +cte_assoc AS ( SELECT *
*                       FROM zc_slsordprivilegedonlysource
*                    )
*                    WITH ASSOCIATIONS (
*                      zc_slsordprivilegedonlysource~\_salesorderprivilegedonly
*                    )
*SELECT +cte_assoc~salesorder,
*       +cte_assoc~\_salesorderprivilegedonly-salesorder AS salesorder2
*  FROM  +cte_assoc
*  INTO TABLE @DATA(lt_zc_slsordprivilegedonlysrc4)
*  PRIVILEGED ACCESS.
*
*####################################################################

    SELECT *
      FROM z_viewwithleftouterjoins
      INTO TABLE @DATA(lt_z_viewwithleftouterjoin).

*####################################################################

    SELECT *
      FROM z_viewwithnullvalues
      WHERE fielda EQ 'A'
      INTO TABLE @DATA(lt_null_values_1).

    SELECT *
      FROM z_viewwithnullvalues
      WHERE NOT fielda EQ 'A'
      INTO TABLE @DATA(lt_null_values_2).

    SELECT *
      FROM z_viewwithnullvalues
      WHERE fieldb NE 'B'
      INTO TABLE @DATA(lt_null_values_3).

    SELECT *
      FROM z_viewwithnullvalues
      WHERE fieldc NE 'C'
      INTO TABLE @DATA(lt_null_values_4).

    SELECT COUNT( DISTINCT fielda ) AS count_a,
           COUNT( DISTINCT fieldb ) AS count_b,
           COUNT( DISTINCT fieldc ) AS count_c
      FROM z_viewwithnullvalues
      INTO TABLE @DATA(lt_null_values_5).

*####################################################################

    SELECT z_viewwithdifferentdatatypes~castnumc
      FROM z_viewwithdifferentdatatypes
      WHERE z_viewwithdifferentdatatypes~castnumc IS INITIAL
      INTO TABLE @DATA(lt_castnumc_1).

    SELECT z_viewwithdifferentdatatypes~numc0000000000
      FROM z_viewwithdifferentdatatypes
      WHERE z_viewwithdifferentdatatypes~numc0000000000 IS INITIAL
      INTO TABLE @DATA(lt_castnumc_2).

    SELECT z_viewwithdifferentdatatypes~castchar
      FROM z_viewwithdifferentdatatypes
      WHERE z_viewwithdifferentdatatypes~castchar IS INITIAL
      INTO TABLE @DATA(lt_castnumc_3).

    SELECT z_viewwithdifferentdatatypes~char0000000000
      FROM z_viewwithdifferentdatatypes
      WHERE z_viewwithdifferentdatatypes~char0000000000 IS INITIAL
      INTO TABLE @DATA(lt_castnumc_4).

    SELECT *
      FROM z_viewwithdifferentdatatypes
      INTO TABLE @DATA(lt_castnumc_5).

    SELECT SINGLE *
      FROM z_viewwithdifferentdatatypes
      WHERE z_viewwithdifferentdatatypes~castchar NE z_viewwithdifferentdatatypes~numc0000000000
      INTO @DATA(ls_castnumc_6).

    IF ( ls_castnumc_6-castchar EQ ls_castnumc_6-numc0000000000 ).
    ELSE.
    ENDIF.

    SELECT SINGLE *
      FROM z_viewwithdifferentdatatypes
      WHERE z_viewwithdifferentdatatypes~castchar EQ z_viewwithdifferentdatatypes~numc0000000000
      INTO @DATA(ls_castnumc_7).



  ENDMETHOD.
ENDCLASS.
