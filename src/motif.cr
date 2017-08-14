require "./lib_motif/*"
require "./motif/*"

class Motif
	property :app, :top_level

	def self.create_element(klass, options : Hash(Symbol, String | Proc(Nil)))
		klass.new(options)
	end

	def initialize(argv, options)
    X11::Xt.set_language_proc(nil, nil, nil)

    @app = uninitialized X11::Xt::AppContext
    argc = ARGV.size
    argv = ARGV.map(&.to_unsafe).to_unsafe
		title = options[:title].to_s

    @top_level = X11::Xt.va_app_initialize(
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

	def render(widget)
		widget.render(top_level)
    X11::Xt.realize_widget(top_level)
    X11::Xt.app_main_loop(app)
	end
end
