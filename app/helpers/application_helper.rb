module ApplicationHelper

def ldate(d)  
  I18n.l(d) unless d.nil?
end

end
