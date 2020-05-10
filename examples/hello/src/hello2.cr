require "motif"
require "./hello/*"

module Hello
  def self.main
    app = Motif::Application.new(ARGV, title: "Hello")
    button = Motif::PushButton.new(label: "Push here to say hello")
    button.add_callback(
      Motif::Callback.new(
        :activate,
        ->(widget : X11::Xt::Widget, client_data : X11::Xt::Pointer, call_data : X11::Xt::Pointer) { puts "Hello from Crystal" },
      )
    )
    app.add_widget(button)
    app.main_loop
  end

  main
end
