require "./widget"

module Motif
  class PushButton < Widget
    property :parent
    @block : Proc(Nil) | Nil
    @managed_widget : X11::Xt::Widget | Nil
    @parent : Widget | Nil

    def initialize(content : String | Nil)
      @content = content.to_s
    end

    def on_activate(&block)
      @block = block
    end

    def managed_widget
      if p = @parent
        if parent_managed_widget = p.managed_widget
          @managed_widget ||= begin
            label = LibXm.string_create_localized @content

            button = X11::Xt.va_create_managed_widget(
              "pushme",
              LibXm.xmPushButtonWidgetClass,
              parent_managed_widget,
              "labelString",
              label,
              nil
            )

            LibXm.string_free(label)

            button
          end
        end
      end
    end

    def start
      if mw = managed_widget
        if b = @block
          boxed_callback = Box.box(b)
          X11::Xt.add_callback(
            mw,
            "activateCallback",
            ->(widget, client_data, call_data) {
              callback = Box(typeof(b)).unbox(client_data)
              callback.call
            },
            boxed_callback
          )
        end
      end
    end
  end
end
