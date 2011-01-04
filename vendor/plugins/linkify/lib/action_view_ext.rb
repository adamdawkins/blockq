module Linkify
	def link_to(*args, &block)
		if !block_given? && args.length == 1
			object = args.first
			possible_label_methods = %w[to_label display_name full_name name title username login value to_s] #this needs to be moved somewhere global
			label_method = possible_label_methods.detect { |m| object.respond_to?(m)}
			link_to(object.send(label_method), object)
		else
			super
		end
	end
end
ActionView::Base.send(:include, Linkify)