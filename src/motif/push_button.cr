module Motif
  class PushButton
    @callbacks : Array(Callback)
    @label : String

    getter :callbacks, :label

    def initialize(@label)
      @label = label
      @callbacks = [] of Callback
    end

    def add_callback(callback)
      @callbacks.push callback
    end

    def instantiate_with_parent(parent)
      xm_label = LibXm.string_create_localized(label)

      @widget = X11::Xt.va_create_managed_widget(
        self.object_id.to_s,
        LibXm.xmPushButtonWidgetClass,
        parent.widget,
        "labelString",
        xm_label,
        nil
      )

      LibXm.string_free(xm_label)

      callbacks.each do |callback|
        X11::Xt.add_callback(
          @widget,
          callback.type,
          callback.proc,
          nil
        )
      end
    end
  end
end
