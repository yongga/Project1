pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "ada__containers_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__io_exceptions_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__os_lib_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "ada__tags_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__streams_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "system__file_control_block_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__finalization_root_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__finalization_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__file_io_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__storage_pools_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__finalization_masters_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__storage_pools__subpools_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__text_io_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "mycommandline_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "mystring_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "mystringtokeniser_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "pin_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "simplestack_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stringtointeger_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "variablestore_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E125 := E125 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "variablestore__finalize_spec");
      begin
         F1;
      end;
      E054 := E054 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      E133 := E133 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__storage_pools__subpools__finalize_spec");
      begin
         F3;
      end;
      E135 := E135 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__finalization_masters__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E075 := E075 - 1;
         F5;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      Ada.Containers'Elab_Spec;
      E126 := E126 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E057 := E057 + 1;
      System.Os_Lib'Elab_Body;
      E080 := E080 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E059 := E059 + 1;
      Ada.Streams'Elab_Spec;
      E056 := E056 + 1;
      System.File_Control_Block'Elab_Spec;
      E083 := E083 + 1;
      System.Finalization_Root'Elab_Spec;
      E078 := E078 + 1;
      Ada.Finalization'Elab_Spec;
      E076 := E076 + 1;
      System.File_Io'Elab_Body;
      E075 := E075 + 1;
      System.Storage_Pools'Elab_Spec;
      E141 := E141 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E135 := E135 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E133 := E133 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E054 := E054 + 1;
      E107 := E107 + 1;
      E111 := E111 + 1;
      E113 := E113 + 1;
      E117 := E117 + 1;
      E121 := E121 + 1;
      E123 := E123 + 1;
      Variablestore'Elab_Spec;
      E125 := E125 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/mycommandline.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/mystring.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/mystringtokeniser.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/pin.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/simplestack.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/stringtointeger.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/variablestore.o
   --   /Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/main.o
   --   -L/Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/
   --   -L/Users/johnnyboy/Desktop/SWEN90010 High Integrity Systems Engineering/Assignment 3 - ADA/assignment3/obj/
   --   -L/users/johnnyboy/opt/gnat/2019/lib/gcc/x86_64-apple-darwin17.7.0/8.3.1/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
