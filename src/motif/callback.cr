module Motif
  class Callback
    @action : Symbol
    # Proc(X11::Xt::Pointer, X11::Xt::SignalId* -> Void)
    @proc : Proc(Pointer(X11::Xt::X_WidgetRec), X11::Xt::Pointer, X11::Xt::Pointer, Nil)

    getter :action, :proc

    def initialize(@action, @proc)
    end

    def type
      case action
      when :activate
        "activateCallback"
      else
        raise "Invalid callback type requested: #{action}"
      end
    end
  end
end
