require "x11"
require "motif"
require "./cmd_area/*"

module CmdArea
  def self.main
    X11::Xt.set_language_proc(nil, nil, nil)

    app = uninitialized X11::Xt::AppContext
    argc = ARGV.size
    argv = ARGV.map(&.to_unsafe).to_unsafe

    top_level = X11::Xt.va_app_initialize(
      pointerof(app),
      "Demos",
      nil,
      0,
      pointerof(argc),
      argv,
      nil,
      nil
    )

    main_w = X11::Xt.va_create_managed_widget(
      "main_w",
      LibXm.xmMainWindowWidgetClass,
      top_level,
      "commandWindowLocation",
      1, # XmCOMMAND_BELOW_WORKSPACE
      nil
    )

    file = LibXm.string_create_localized "File"

    menubar = LibXm.va_create_simple_menu_bar(
      main_w.as(LibXm::Widget),
      "menubar",
      "cascadeButton", # XmVaCASCADEBUTTON
      file,
      "F",
      nil
    )

    LibXm.string_free(file)

    quit = LibXm.string_create_localized "Quit"

    menu = LibXm.va_create_simple_pulldown_menu(
      menubar,
      "file_menu",
      0,
      ->(drawing_a,client_data,call_data) { exit(0) },
      "pushButton",
      quit,
      "Q",
      nil, nil, nil
    )

    LibXm.string_free(quit)

    X11::Xt.manage_child(menubar.as(Pointer(X11::Xt::X_WidgetRec)))

    args = StaticArray(LibXm::ArgRec, 5).new(LibXm::ArgRec.new)

    X11::XtUtil.set_arg(args[0], "rows", 24)
    X11::XtUtil.set_arg(args[1], "columns", 80)
    X11::XtUtil.set_arg(args[2], "editable", 0)
    X11::XtUtil.set_arg(args[3], "editMode", 0) # 0 : XmMULTI_LINE_EDIT

    text_w = LibXm.create_scrolled_text(main_w.as(LibXm::Widget), "text_w", args.to_unsafe.as(LibXm::ArgList), 4)
    X11::Xt.manage_child(text_w.as(Pointer(X11::Xt::X_WidgetRec)))

    X11::Xt.va_set_values(menu.as(Pointer(X11::Xt::X_WidgetRec)), "userData", text_w, nil)

    file = LibXm.string_create_localized("Command:")
    command_w = X11::Xt.va_create_widget("command_w", LibXm.xmCommandWidgetClass, main_w, "promptString", file, nil)
    LibXm.string_free(file)


    X11::Xt.add_callback(
      command_w,
      "commandEnteredCallback",
      ->(widget, client_data, call_data) {
        cmd = uninitialized Pointer(UInt8)
        cbs = call_data.as(LibXm::CommandCallbackStruct)
        str =  LibXm.string_create_localized cbs.value.as(LibC::Char*)
        LibXm.string_get_l_to_r(str , "FONTLIST_DEFAULT_TAG_STRING", pointerof(cmd))
        if cmd.nil?
          X11::Xt.free(cmd)
          return nil
        end

        output = String::Builder.new
        Process.run(String.new(cmd), output: output) do
          str = output.to_s
          LibXm.text_replace(text_w, str.size, str.size, str)
        end
      },
      text_w.as(Pointer(Void))
    )
    X11::Xt.manage_child(command_w)

    X11::Xt.realize_widget(top_level)
    X11::Xt.app_main_loop(app)
  end

  main
end
