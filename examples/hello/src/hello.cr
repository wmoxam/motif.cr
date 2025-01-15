require "motif"

module Hello
  def self.main
    window = Motif::Window.new title: "Hello"

    button = Motif::PushButton.new "Push here to say hello"
    button.on_activate do
      puts "Hello from Crystal"
    end

    window.add button
    window.start
  end

  main
end
