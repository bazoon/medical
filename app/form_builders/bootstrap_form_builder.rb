class BootstrapFormBuilder < SimpleForm::FormBuilder


def text_field(name, options = {})
 options.reverse_merge!(:class => "span4 input-xlarge")

 required = required_field?(@object,name)
 options[:required] = required

 content = super
 content = content + hint_field(options[:hint]) if defined?(options[:hint])
 content = @template.content_tag(:div,content,:class => "controls")

 label = label_field(options,required)

 label + content

 @template.content_tag(:div,label + content,:class => "control-group")
end

def select(method, choices, options = {}, html_options = {})

 html_options.reverse_merge!(:class => "span4")

 required = required_field?(@object,method)
 options[:required] = required


 content = super

 content = content + hint_field(options[:hint]) if defined?(options[:hint])

 content = @template.content_tag(:div,content,:class => "controls")
 label = label_field(options,required)

 @template.content_tag(:div,label + content,:class => "control-group")
end

def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})

 html_options.reverse_merge!(:class => "span4")

 required = required_field?(@object,method)
 options[:required] = required


 content = super

 content = content + hint_field(options[:hint]) if defined?(options[:hint])

 content = @template.content_tag(:div,content,:class => "controls")
 label = label_field(options,required)
 @template.content_tag(:div,label + content,:class => "control-group")
end

def check_box(method, options = {})
 check = super
 check = check + " " + @template.content_tag(:span,options[:label]) if defined?(options[:label])

 in_label = @template.content_tag(:label,check)

# in_ul = @template.content_tag(:li,in_li)
 #in_input = @template.content_tag(:ul,in_ul,:class => "inputs-list")
 
 content = @template.content_tag(:div,in_label,:class => "controls")
 @template.content_tag(:div,content,:class => "control-group")
end


def radio_button(method,tag_value, options = {})
 radio = super
 radio = radio + " " + @template.content_tag(:span,options[:label]) if defined?(options[:label])

 required = required_field?(@object,method)
 options[:required] = required

 in_label = @template.content_tag(:label,radio)

 #in_ul = @template.content_tag(:li,in_li)
 #
# in_input = @template.content_tag(:ul,in_ul,:class => "inputs-list")
 
 content = @template.content_tag(:div,in_label,:class => "controls")
 @template.content_tag(:div,content,:class => "control-group")
end

def date_select(name, options = {})
 options.reverse_merge!(:class => "ui-datepicker input-xlarge span4")
 options.reverse_merge!(:value => I18n.l(@object.send(name))) unless @object.send(name).nil?


 content = text_field(name,options)
end

def text_area(name, options = {})
 options.reverse_merge!(:class => "span4")

 required = required_field?(@object,name)
 options[:required] = required


 content = super

 content = content + hint_field(options[:hint]) if defined?(options[:hint])

 content = @template.content_tag(:div,content,:class => "controls")

 label = label_field(options,required)
 @template.content_tag(:div,label + content,:class => "control-group")
end


  





private

 def hint_field(text,options ={})
  @template.content_tag(:p,text,:class => "help-block") 
 end

 def label_field(options,required)
  required_mark = ""
  required_mark = "*".html_safe if required
  @template.content_tag(:label,options[:label]+required_mark,:class => "control-label")
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
