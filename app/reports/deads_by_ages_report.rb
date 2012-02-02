class DeadsByAgesReport < BaseReport
 attr_accessor :by_age_and_date, :by_years


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 


 clients = Client.sector(@sector_num).died_between(sd,ed)

 by_age = clients.group_by do |c|
    age = (c.death_date - c.birth_date)/365.25
    case age
       when 0..59 then 1
       when 60..69 then 2
       when 70..79 then 3
       when 80..89 then 4
       else 5
    end
  end

 on_observation = by_age[num]
 on_observation.count unless on_observation.nil?
end


end
