---
outline: [2, 4]
---

# Installation

### 1. Installation with abapGit

Install the project with [abapGit.](https://abapgit.org)
![alt text](image.png)

### 2. Set up a new HTTP service
Create a new HTTP Service with the following handler implementation:

::: code-group

```abap [ABAP]
CLASS zcl_my_handler_onprem DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_http_extension.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_my_handler_onprem IMPLEMENTATION.

  METHOD if_http_extension~handle_request.

    z2ui5_cl_http_handler=>factory( server )->main( ).

  ENDMETHOD.

ENDCLASS.
```

```abap [ABAP Cloud]
CLASS zcl_my_handler_cloud DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_http_service_extension.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_my_handler_cloud IMPLEMENTATION.

  METHOD if_http_service_extension~handle_request.

    z2ui5_cl_http_handler=>factory( req = request res = response )->main( ).

  ENDMETHOD.

ENDCLASS.
```
:::


### 3. Start your App
Call your HTTP Service in the browser, press check and start the app:
<img width="800" alt="image" src="https://github.com/user-attachments/assets/c8962298-068d-4efb-a853-c44a9b9cda56"><br>
<img width="800" alt="image" src="https://github.com/user-attachments/assets/beee0551-494f-4e29-98bd-529395e27405">


::: warning Security

The project does not connect to external systems. It communicates solely with the HTTP handler that you define. You are in complete control—decide who can access this handler and establish custom authentication methods. As your needs evolve, you can further refine the handler as you can see [here.](/configuration/general)

:::

