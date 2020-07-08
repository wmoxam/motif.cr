require "motif"

module MainList
  def self.main
    app = Motif::Application.new(ARGV, title: "Main List")
    window = Motif::Window.new

    list = Motif::ScrolledList.new(%w(Red Green Blue Orange Maroon Grey Black White))
    list.visible_items = 5

    app.add(window)
    window.add(list)
    app.main_loop
  end

  main
end
