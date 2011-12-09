class DispByMkbReport < BaseReport
  attr_accessor :years
  attr_accessor :groups
  
def prepare(sd,ed,years)  
 @sd = sd
 @ed = ed
 @years = years
 @years_total=Array.new

 fill_groups
end

#
def fill_groups
 @data = Disp.find_by_sql ["select date_part('year',actual_date) as year,detach_date,ref_mkb_types.name,count(*)
                            as total
                            from disps,ref_mkb_types,clients 
                            where (actual_date between ? and ?) and (disps.client_id=clients.id) 
                            and (disps.mkb_type_id=ref_mkb_types.id) and ((detach_date > ?) or (detach_date is NULL) )
                            group by year,ref_mkb_types.name,detach_date
                            order by ref_mkb_types.name",@sd,@ed,@sd]
 @groups = Hash.new
 @group_total = Array.new
 @years.each { |year| @group_total[year] = 0 }

 @data.each do |item|
 @groups[item.name] ||=  Hash.new
 
  if belongs_to_year(item.year.to_i,item.detach_date) and has_no_nils(item)

   @groups[item.name][item.year.to_i] = 0 if @groups[item.name][item.year.to_i].nil?
   @groups[item.name][item.year.to_i] += item.total.to_i 
   
   
   @group_total[item.year.to_i] += item.total.to_i 


  end 


 end

end

def group_total(year)
 @group_total[year] unless @group_total.nil? or @group_total[year].nil?
end

private

def has_no_nils(item)
 result = item.nil? or item.name.nil? or item.year.nil? or item.total.nil?
 not result
end

def belongs_to_year(year,detach_date)
 detach_year = Date.parse(detach_date).year unless detach_date.nil?
 detach_year.nil? or detach_year > year
end
  


end
