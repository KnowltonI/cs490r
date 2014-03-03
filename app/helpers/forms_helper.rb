module FormsHelper
	def self.included(base)
	    ActionView::Base.default_form_builder = StandardBuilder
	end

	class StandardBuilder < ActionView::Helpers::FormBuilder
		def error_messages(options = {})
			return unless object.respond_to?(:errors) && object.errors.any?

			if options[:error_message].nil?  
				errors_title = @template.content_tag(:h3, "Please fix the following errors:", class: "error-title")
			else
				errors_title = @template.content_tag(:h3, options[:error_message], class: "error-title")
			end
			errors_list = ""
			errors_list << object.errors.full_messages.map { |message| @template.content_tag(:li, message) }.join("\n")

			error_messages = @template.content_tag(:ul, errors_list.html_safe, class: "error-messages")

			@template.content_tag(:div, errors_title+error_messages, class: "form-errors")
		end

	end
end