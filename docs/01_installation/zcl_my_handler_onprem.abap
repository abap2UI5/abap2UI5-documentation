CLASS zcl_my_handler_onprem DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_http_extension.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_my_handler_onprem IMPLEMENTATION.

METHOD if_http_extension~handle_request.

   server->response->set_cdata( z2ui5_cl_http_handler=>main( server->request->get_cdata( ) ) ).
   server->response->set_header_field( name = `cache-control` value = `no-cache` ).
   server->response->set_status( code = 200 reason = `success` ).

ENDMETHOD.

ENDCLASS.
