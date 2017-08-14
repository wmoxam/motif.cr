require "x11"
require "motif"

module Hello
  def self.main
		app = Motif.new(ARGV, {title: "Hello"})

		button = Motif.create_element(
			Motif::PushButton,
			{
				label: "Push here to say hello"
			}.to_h
		)

		button.add_callback {
			puts "Hello from Crystal"
		}

		app.render(button)
  end

  main
end