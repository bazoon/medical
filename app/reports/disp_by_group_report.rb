class DispByGroupReport < BaseReport
  attr_accessor :years
  attr_accessor :groups
  
def prepare(sd,ed,years)  
 @sd = sd
 @ed = ed
 @years = years
 @years_total=Array.new

 #fill_groups

 @observed = Hash.new 

 @years.each do |y|
  
  @observed[y] = Array.new

  (1..5).to_a.each do |num|
   @observed[y][num] = get_observed(y,num)
  end

 end



end

#
#def fill_groups
# @data = Disp.find_by_sql ["select date_part('year',actual_date) as year,detach_date,disp_group,count(*)
#                                          as total from disps,clients where (actual_date between ? and ?) and 
#                                          (disps.client_id=clients.id) and ((detach_date > ?) or (detach_date is NULL) )
#                                          group by year,disp_group,detach_date
#                                          order by disp_group",@sd,@ed,@sd]
#
# @groups = Hash.new
# @group_total = Array.new
# @years.each { |year| @group_total[year] = 0 }
#
# @data.each do |item|
# @groups[item.disp_group] ||=  Hash.new
# 
#  if belongs_to_year(item.year.to_i,item.detach_date) and has_no_nils(item)
#
#   @groups[item.disp_group][item.year.to_i] = 0 if @groups[item.disp_group][item.year.to_i].nil?
#   @groups[item.disp_group][item.year.to_i] += item.total.to_i 
#   
#   
#   @group_total[item.year.to_i] += item.total.to_i 
#
#
#  end 
#
#
# end
#
#end

def group_total(year)
 @group_total[year] unless @group_total.nil? or @group_total[year].nil?
end

def year_total(year)
 @observed[year].compact.sum unless @observed.nil? or @observed[year].nil?
end  

def observed(year,num)
 @observed[year][num]
end



private

def has_no_nils(item)
 result = item.nil? or item.disp_group.nil? or item.year.nil? or item.total.nil?
 not result
end

def belongs_to_year(year,detach_date)
 detach_year = Date.parse(detach_date).year unless detach_date.nil?
 detach_year.nil? or detach_year > year
end

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 disps = Disp.client_present(ed).between(sd,ed)

 on_observation = case num
     when 1 then disps.disp_group(1)
     when 2 then disps.disp_group(2)
     when 3 then disps.disp_group(3)
     when 4 then disps.disp_group(4)
     when 5 then disps.disp_group(5)
 end

 on_observation.count unless on_observation.nil?
end


end
