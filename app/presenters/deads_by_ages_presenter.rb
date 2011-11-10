class DeadsByAgesPresenter
  

def initialize(template)
 @template = template  
end

 def h
   @template
 end


def rel_row_value(items,totals)
"#{((items.count.to_f / totals.to_f)*100).round(2)} %"unless items.nil?
end

def abs_row_value(items)
 items.count unless items.nil?
end


end
