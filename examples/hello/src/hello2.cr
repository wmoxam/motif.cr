require "motif"
require "./hello/*"

module Hello
  def self.main
    app = Motif::Application.new(ARGV, title: "Hello")
    button = Motif::PushButton.new(label: "Push here to say hello")
    button.callback(:activate) do |widget, client_data, call_data|
      puts "Hello from Crystal"
    end
    app.add(button)
    app.main_loop
  end

  main
end
