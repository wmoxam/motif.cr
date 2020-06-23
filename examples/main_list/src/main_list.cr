require "x11"
require "motif"

module MainList
  VERSION = "0.1.0"

  def self.main
    X11::Xt.set_language_proc(nil, nil, nil)

    app = uninitialized X11::Xt::AppContext
    argc = ARGV.size
    argv = ARGV.map(&.to_unsafe).to_unsafe

    top_level = X11::Xt.va_app_initialize(
      pointerof(app),
      "Main List",
      nil,
      0,
      pointerof(argc),
      argv,
      nil,
      nil
    )

    main_w = X11::Xt.va_create_managed_widget(
      "main_window",
      LibXm.xmMainWindowWidgetClass,
      top_level,
      nil
    )

    list_w = LibXm.create_scrolled_list(main_w.as(LibXm::Widget), "main_list", nil, 0)

    X11::Xt.va_set_values(list_w.as(Pointer(X11::Xt::X_WidgetRec)),
      "XtVaTypedArg", LibXm::Nitems, LibXm::RString,
      "Red, Green, Blue, Orange, Maroon, Grey, Black, White", 53,
      LibXm::NitemCount, 8,
      LibXm::NvisibleItemCount, 5,
      nil)

    X11::Xt.manage_child(list_w.as(Pointer(X11::Xt::X_WidgetRec)))

    # set the list_w as the "work area" of the main window
    X11::Xt.va_set_values(main_w.as(Pointer(X11::Xt::X_WidgetRec)), LibXm::NworkWindow, X11::Xt.parent(list_w.as(Pointer(X11::Xt::X_WidgetRec))), nil)

    X11::Xt.realize_widget(top_level)
    X11::Xt.app_main_loop(app)
  end

  main
end
