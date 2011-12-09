class DispByGroupImobileReport < DispByGroupReport
  attr_accessor :years
  attr_accessor :groups

def fill_groups
 @data = MedDiagnosticTest.find_by_sql ["select date_part('year',actual_date) as year,detach_date,disp_group,count(*)
                                          as total from disps,clients where (actual_date between ? and ?) and 
                                          (disps.client_id=clients.id) and ((detach_date > ?) or (detach_date is NULL))
                                          and (disabled=true)
                                          group by year,disp_group,detach_date
                                          order by disp_group",@sd,@ed,@sd]
 @groups = Hash.new
 @group_total = Array.new
 @years.each { |year| @group_total[year] = 0 }

 @data.each do |item|
 @groups[item.disp_group] ||=  Hash.new
 
  if belongs_to_year(item.year.to_i,item.detach_date) and has_no_nils(item)

   @groups[item.disp_group][item.year.to_i] = 0 if @groups[item.disp_group][item.year.to_i].nil?
   @groups[item.disp_group][item.year.to_i] += item.total.to_i 
   
   
   @group_total[item.year.to_i] += item.total.to_i 


  end 


 end

end

end
