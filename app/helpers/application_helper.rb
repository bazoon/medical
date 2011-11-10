module ApplicationHelper

def present(klass)
  klass ="#{klass}Presenter".constantize
  presenter = klass.new(self)
  yield presenter if block_given?
  presenter
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
