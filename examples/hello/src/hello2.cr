require "motif"
require "./hello/*"


module Hello
  def self.main
    app = Motif::Application.new(ARGV, title: "Hello")
    button = Motif::PushButton.new(app, label: "Push here to say hello")
    button.add_callback(
      on: :activate,
      callback: ->() { puts "Hello from Crystal" },
    )
    app.main_loop
  end

  main
end
