class ImobileDeathStructureReport < BaseReport
  attr_accessor :years
  attr_accessor :deaths
  
def prepare(sd,ed,years)  
 @sd = sd
 @ed = ed
 @years = years
 @years_total=Array.new

 fill_deaths
end

def fill_deaths
 @data = Client.find_by_sql ["select date_part('year',death_date) as year,ref_death_reasons.name,count(*)
                              as total from clients,ref_death_reasons where (death_date between ? and ?) and (clients.death_reason_id = ref_death_reasons.id)
                              and not (death_date is NULL) and (disabled = true)
                              group by year,ref_death_reasons.name",@sd,@ed]
 
 @deaths = Hash.new
 @death_total = Array.new
 @years.each { |year| @death_total[year] = 0 }

 @data.each do |item|
  @deaths[item.name] ||=  Hash.new
  @deaths[item.name][item.year.to_i] = item.total.to_i unless item.nil? or item.name.nil? or item.year.nil? or item.total.nil?
  @death_total[item.year.to_i] += item.total.to_i 
 end

end

def death_total(year)
 @death_total[year] unless @death_total.nil? or @death_total[year].nil?
end





  
end
