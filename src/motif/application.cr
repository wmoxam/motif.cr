module Motif
  class Application
    @argc : Int32
    @argv : Array(String)
    @title : String

    getter :argc, :argv, :title

    @app : X11::Xt::AppContext

    def initialize(argv, title)
      @argc = argv.size
      @argv = argv
      @title = title
      @app = uninitialized X11::Xt::AppContext
    end


    def main_loop
      X11::Xt.realize_widget(widget)
      X11::Xt.app_main_loop(@app)
    end

    def widget
      @top_level ||= X11::Xt.va_app_initialize(
        pointerof(@app),
        @title,
        nil,
        0,
        pointerof(@argc),
        @argv.map(&.to_unsafe).to_unsafe,
        nil,
        nil
      )
    end
  end
end
