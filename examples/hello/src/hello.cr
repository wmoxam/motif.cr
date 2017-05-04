require "x11"
require "motif"
require "./hello/*"

module Hello
  def self.main
    X11::Xt::set_language_proc(nil, nil, nil)

    top_level = X11::Xt::va_app_initialize(
      app,
      "Hello",
      nil,
      0,
      ARGV.size,
      ARGV,
      nil,
      nil
    )
    label = Motif::LibXm::string_create_localized "Push here to say hello"
    button = X11::Xt::va_create_managed_widget(
      "pushme",
      Motif::LibXm::xmPushButtonWidgetClass,
      top_level,
      "labelString",
      label,
      nil
    )
    Motif::LibXm::string_free(label)
    X11::Xt::add_callback(
      button,
      "activateCallback",
      button_pushed,
      nil
    )

    X11::Xt::realize_widget(top_level)
    X11::Xt::app_main_loop(app)
  end

  main
end
