class PeopleStructureReport < BaseReport
  attr_accessor :years
  attr_accessor :totals_by_year


private

def get_observed(year,num)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 

 clients = Client.includes.present(ed).sector(@sector_num)

 benefits = Benefit.client_present(ed).primary
 benefits = apply_sector_num(benefits)  

 on_observation = case num
     when 1 then benefits.war_invalids
     when 2 then benefits.war_participants
     when 3 then benefits.conflict_participants
     when 4 then benefits.widows
     when 5 then benefits.blokadniks
     when 6 then benefits.prisoners
     when 7 then benefits.front_workers
     when 8 then benefits.repressed
     when 9 then benefits.chernobil
     when 10 then clients.work_veterans
     when 11 then clients.pensioners
 end
#
#
 on_observation.count unless on_observation.nil?
end







end
