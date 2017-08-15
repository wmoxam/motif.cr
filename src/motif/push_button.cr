class Motif
  class PushButton
    property :callback, :options

    def initialize(@options : Hash(Symbol, String))
      @callback = nil
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

      if callback = @callback
        boxed_data = Box.box(@callback)

        X11::Xt.add_callback(
          button,
          "activateCallback",
          ->(widget, client_data, call_data) {
            data_as_callback = Box(typeof(callback)).unbox(client_data)
            data_as_callback.call widget, client_data, call_data
          },
          boxed_data
        )
      end
    end

    def add_callback(&cb : X11::Xt::CallbackProc)
      @callback = cb
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
