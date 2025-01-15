require "./widget"

module Motif
  class Window < Widget
    getter :title, :widgets

    def initialize(title : String)
      @app = uninitialized X11::Xt::AppContext
      @title = title
      @widgets = [] of PushButton
    end

    def add(widget)
      @widgets << widget
    end

    def managed_widget
      @managed_widget ||= begin
        argc = ARGV.size
        argv = ARGV.map(&.to_unsafe).to_unsafe

        top_level = X11::Xt.va_app_initialize(
          pointerof(@app),
          title,
          nil,
          0,
          pointerof(argc),
          argv,
          nil,
          nil
        )
      end
    end

    def start
      X11::Xt.set_language_proc(nil, nil, nil)

      widgets.each do |widget|
        widget.parent = self
        widget.start
      end

      X11::Xt.realize_widget(managed_widget)
      X11::Xt.app_main_loop(@app)
    end
  end
end
