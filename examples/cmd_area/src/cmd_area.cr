require "x11"
require "motif"

# From https://www.softintegration.com/chhtml/toolkit/demos/X11/motif/ch04/cmd_area1.html
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
      LibXm::NcommandWindowLocation,
      LibXm::COMMAND_BELOW_WORKSPACE,
      nil
    )

    file = LibXm.string_create_localized "File"

    menubar = LibXm.va_create_simple_menu_bar(
      main_w.as(LibXm::Widget),
      "menubar",
      LibXm::VaCASCADEBUTTON,
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
      ->(drawing_a, client_data, call_data) { exit(0) },
      LibXm::VaPUSHBUTTON,
      quit,
      "Q",
      nil, nil, nil
    )

    LibXm.string_free(quit)

    X11::Xt.manage_child(menubar.as(Pointer(X11::Xt::X_WidgetRec)))

    args = [] of LibXm::ArgRec

    arg1 = LibXm::ArgRec.new
    arg2 = LibXm::ArgRec.new
    arg3 = LibXm::ArgRec.new
    arg4 = LibXm::ArgRec.new

    arg1.name = "rows"; arg1.value = 24
    arg2.name = "columns"; arg2.value = 80
    arg3.name = "editable"; arg3.value = 0
    arg4.name = "editMode"; arg4.value = 0

    args << arg1; args << arg2; args << arg3; args << arg4

    text_w = LibXm.create_scrolled_text(main_w.as(LibXm::Widget), "text_w", args.to_unsafe.as(LibXm::ArgList), args.size)
    X11::Xt.manage_child(text_w.as(Pointer(X11::Xt::X_WidgetRec)))

    X11::Xt.va_set_values(menu.as(Pointer(X11::Xt::X_WidgetRec)), "userData", text_w, nil)

    file = LibXm.string_create_localized("Command:")
    command_w = X11::Xt.va_create_widget("command_w", LibXm.xmCommandWidgetClass, main_w, LibXm::NpromptString, file, nil)
    LibXm.string_free(file)

    X11::Xt.add_callback(
      command_w,
      LibXm::NcommandEnteredCallback,
      ->(command_widget, client_data, call_data) {
        cmd = uninitialized Pointer(UInt8)
        cbs = call_data.as(Pointer(LibXm::CommandCallbackStruct)).value

        str = cbs.value
        LibXm.string_get_l_to_r(str, "FONTLIST_DEFAULT_TAG_STRING", pointerof(cmd))
        if cmd.is_a?(Nil)
          X11::Xt.free(cmd)
          return nil
        end

        output = String::Builder.new
        error = String::Builder.new
        Process.run(String.new(cmd), output: output, error: error, shell: true)
        str = output.to_s
        LibXm.text_replace(client_data.as(LibXm::Widget), 0, 0, str)
      },
      text_w.as(Pointer(Void))
    )
    X11::Xt.manage_child(command_w)

    X11::Xt.realize_widget(top_level)
    X11::Xt.app_main_loop(app)
  end

  main
end
