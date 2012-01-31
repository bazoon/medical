class BaseReport
  attr_accessor :years

#sd,ed даты отчетного периода
#num_rows количество строк отчета
#section_num номер участка
#
def prepare(sd,ed,years,sector_num)  
 @sd = sd
 @ed = ed
 @years = years
 @sector_num =sector_num
end  
  
def prepare_fixed_num_rows(sd,ed,years,num_rows,sector_num)  
 @sd = sd
 @ed = ed
 @years = years
 @sector_num = sector_num

 @years_total=Array.new
 

 @observed = Hash.new 

 @years.each do |y|
  
  @observed[y] = Array.new

  (1..num_rows).to_a.each do |num|
   @observed[y][num] = get_observed(y,num)
  end
 end

end

 def apply_sector_num(relation) 
  relation.client_sector(@sector_num) unless @sector_num.nil? or @sector_num.blank?
 end


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

  def value_or_zero(value)
    result = 0
    result = value unless value.nil? 
    result
  end

def year_total(year)
 @observed[year].compact.sum unless @observed.nil? or @observed[year].nil?
end  

def observed(year,num)
 @observed[year][num]
end



protected




end

