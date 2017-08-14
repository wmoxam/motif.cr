require "x11"
require "motif"

module Hello
  def self.main
    X11::Xt.set_language_proc(nil, nil, nil)

    app = uninitialized X11::Xt::AppContext
    argc = ARGV.size
    argv = ARGV.map(&.to_unsafe).to_unsafe

    top_level = X11::Xt.va_app_initialize(
      pointerof(app),
      "Hello",
      nil,
      0,
      pointerof(argc),
      argv,
      nil,
      nil
    )
    label = LibXm.string_create_localized "Push here to say hello"
    button = X11::Xt.va_create_managed_widget(
      "pushme",
      LibXm.xmPushButtonWidgetClass,
      top_level,
      "labelString",
      label,
      nil
    )
    LibXm.string_free(label)
    X11::Xt.add_callback(
      button,
      "activateCallback",
      ->(widget, client_data, call_data) { puts "Hello from Crystal" },
      nil
    )

    X11::Xt.realize_widget(top_level)
    X11::Xt.app_main_loop(app)
  end

  main
end
