class BasePresenter


def initialize(template)
 @template = template  
end

 def h
   @template
 end

 def method_missing(*args,&block)
   @template.send(*args,&block)
 end

def get_rel(value,total)
 if total != 0
  "#{((value.to_f / total.to_f)*100).round(2)} "
 else
   0
 end  
end
  
end
