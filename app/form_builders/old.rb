
class BootstrapFormBuilder < SimpleForm::FormBuilder


def text_field(name, options = {})
 options.reverse_merge!(:class => "span6")

 required = required_field?(@object,name)
 options[:required] = required

 content = super
 content = content + hint_field(options[:hint]) if defined?(options[:hint])
 content = @template.content_tag(:div,content,:class => "input")


 label = label_field(options,required)

 @template.content_tag(:div,label + content,:class => "clearfix")
end

def select(method, choices, options = {}, html_options = {})

 options.reverse_merge!(:class => "span6")

 required = required_field?(@object,method)
 options[:required] = required


 content = super

 content = content + hint_field(options[:hint]) if defined?(options[:hint])

 content = @template.content_tag(:div,content,:class => "input")
 label = label_field(options,required)

 @template.content_tag(:div,label + content,:class => "clearfix")
end

def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})

 options.reverse_merge!(:class => "span6")

 required = required_field?(@object,method)
 options[:required] = required


 content = super

 content = content + hint_field(options[:hint]) if defined?(options[:hint])

 content = @template.content_tag(:div,content,:class => "input")
 label = label_field(options,required)
 @template.content_tag(:div,label + content,:class => "clearfix")
end

def check_box(method, options = {})
 check = super
 check = check + " " + @template.content_tag(:span,options[:label]) if defined?(options[:label])

 in_li = @template.content_tag(:label,check)

 in_ul = @template.content_tag(:li,in_li)
 in_input = @template.content_tag(:ul,in_ul,:class => "inputs-list")
 content = @template.content_tag(:div,in_input,:class => "input")
 @template.content_tag(:div,content,:class => "clearfix")
end


def radio_button(method,tag_value, options = {})
 radio = super
 radio = radio + " " + @template.content_tag(:span,options[:label]) if defined?(options[:label])

 required = required_field?(@object,method)
 options[:required] = required

 in_li = @template.content_tag(:label,radio)

 in_ul = @template.content_tag(:li,in_li)
 in_input = @template.content_tag(:ul,in_ul,:class => "inputs-list")
 content = @template.content_tag(:div,in_input,:class => "input")
 @template.content_tag(:div,content,:class => "clearfix")
end

def date_select(name, options = {})
 options.reverse_merge!(:class => "span6 ui-datepicker")
 options.reverse_merge!(:value => I18n.l(@object.send(name))) unless @object.send(name).nil?


 content = text_field(name,options)
end

def text_area(name, options = {})
 options.reverse_merge!(:class => "span6")

 required = required_field?(@object,name)
 options[:required] = required


 content = super

 content = content + hint_field(options[:hint]) if defined?(options[:hint])

 content = @template.content_tag(:div,content,:class => "input")

 label = label_field(options,required)
 @template.content_tag(:div,label + content,:class => "clearfix")
end


 

private

 def hint_field(text,options ={})
  @template.content_tag(:span,text,:class => "help-block") 
 end

 def label_field(options,required)
  required_mark = ""
  required_mark = "*".html_safe if required
  @template.content_tag(:label,options[:label]+required_mark)
 end

def required_field?(obj,attribute)
  target = (obj.class == Class) ? obj : obj.class
  target.validators_on(attribute).map(&:class).include?(ActiveModel::Validations::PresenceValidator)
end

def clear_fix(&block)
 content = yield
 @template.content_tag(:div,content,:class => "clearfix" )
end


end
