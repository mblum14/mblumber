require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'

def safely_require(gem, &block)
	begin
		require gem
		yield block if block_given?
	rescue => e
		warn "failed to load #{gem}: #{e}"
	end
end

safely_require('awesome_print')
safely_require('wirble') { Wirble.init; Wirble.colorize }
safely_require('hirb') { Hirb.enable } if defined? Rails

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
def y(obj)
	puts obj.to_yaml
end

class Object
	def gvim(method_name)
		file, line = method(method_name).source_location
		`gvim '#{file}' -l #{line}`
	end
end

if defined? Rails and Hirb
	Hirb::Formatter.dynamic_config['ActiveRecord::Base']
else
	IRB::Irb.class_eval do
		def output_value
			ap @context.last_value
		end
	end
end

WIRBLE_COLORS = {
	# delimiter colors
	:comma => :nothing,
	:refers => :light_gray,

	# containter colors (has and array)
	:open_hash => :nothing,
	:close_hash => :nothing,
	:open_array => :nothing,
	:close_array => :nothing,

	# object colors
	:open_object => :light_red,
	:object_class => :red,
	:object_addr_prefix => :brown,
	:object_line_prefix => :brown,
	:close_object => :light_red,

	# symbol colors
	:symbol => :nothing,
	:symbol_prefix => :nothing,

	# string colors
	:open_string => :brown,
	:string => :brown,
	:close_string => :brown,

	# misc colors
	:number => :light_blue,
	:keyword => :green,
	:class => :light_red,
	:range => :light_green,
}

Wirble::Colorize.colors = WIRBLE_COLORS
