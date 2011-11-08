module ApplicationHelper

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
