module Motif
  class Window
    @widget : Pointer(X11::Xt::X_WidgetRec)

    getter :widget

    def initialize
      @widget = uninitialized Pointer(X11::Xt::X_WidgetRec)
    end

    def add(child)
      child.instantiate_with_parent(self)
    end

    def instantiate_with_parent(parent)
      @widget = X11::Xt.va_create_managed_widget(
        "main_window",
        LibXm.xmMainWindowWidgetClass,
        parent.widget,
        nil
      )
    end
  end
end
