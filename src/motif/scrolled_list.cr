module Motif
  class ScrolledList
    @items : Array(String)
    @visible_items : Int32
    @widget : LibXm::Widget

    getter :items
    property :visible_items

    def initialize(@items)
      @visible_items = @items.size
      @widget = uninitialized LibXm::Widget
    end

    def instantiate_with_parent(parent)
      list = LibXm.create_scrolled_list(parent.widget.as(LibXm::Widget), "list", nil, 0)

      X11::Xt.va_set_values(list.as(Pointer(X11::Xt::X_WidgetRec)),
        "XtVaTypedArg", LibXm::Nitems, LibXm::RString,
        items_list, items_list_string_length,
        LibXm::NitemCount, items.size,
        LibXm::NvisibleItemCount, visible_items,
        nil)

      X11::Xt.manage_child(list.as(Pointer(X11::Xt::X_WidgetRec)))

      @widget = list
    end

    private def items_list
      items.join(", ")
    end

    private def items_list_string_length
      items_list.size + 1
    end
  end
end
