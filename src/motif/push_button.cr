class Motif
  class PushButton
    property :options

    def initialize(@options : Hash(Symbol, String))
      @on_click = nil
    end

    def render(parent)
      label = label_string
      button = X11::Xt.va_create_managed_widget(
        "pushme",
        LibXm.xmPushButtonWidgetClass,
        parent,
        "labelString",
        label_string,
        nil
      )
      LibXm.string_free(label)

      if on_click = @on_click
        boxed_on_click = Box.box(@on_click)

        X11::Xt.add_callback(
          button,
          "activateCallback",
          ->(widget, client_data, call_data) {
            unboxed_on_click = Box(typeof(on_click)).unbox(client_data)
            unboxed_on_click.call widget, client_data, call_data
          },
          boxed_on_click
        )
      end
    end

    def on_click(&handler : X11::Xt::CallbackProc)
      @on_click = handler
    end

    private def activate_callback
      if @options[:callback] && @options[:callback].is_a? Proc(Nil)
        @options[:callback].as(Proc(Nil))
      else
        nil
      end
    end

    private def label_string
      str = if @options[:label].nil?
              ""
            elsif @options[:label].is_a? String
              @options[:label].as(String)
            else
              ""
            end

      LibXm.string_create_localized str
    end
  end
end
