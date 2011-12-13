module ApplicationHelper

 def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
 #   binding.pry
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end




#Используется для динамического добавления дочерних записей в форму
#например добавление новых диагнозов в форму профосмотра
def link_to_add_fields(name, f, association)
  #binding.pry
  new_object = f.object.class.reflect_on_association(association).klass.new
  
  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
    render(association.to_s.singularize + "_fields", :b => builder)
  end
  link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
end

def bootstrap_form_for(*args, &block)
  options = args.extract_options!
  options.merge!(:builder => BootstrapFormBuilder)
 # options.merge!(:validate => true)
  form_for(*(args + [options]), &block)
end


def present(klass)
  klass ="#{klass}Presenter".constantize
  presenter = klass.new(self)
  yield presenter if block_given?
  presenter
end  

def report(klass)
  klass ="#{klass}Report".constantize
  rep = klass.new(self)
  yield rep if block_given?
  rep
end

def ldate(d)  
  I18n.l(d) unless d.nil?
end



def boolean_to_yes_no(value)
  if value
    I18n.t(:y) 
  else
    I18n.t(:n)
  end
end

end
