class DeathReportsReport < BaseReport
  attr_accessor :clients, :by_years

def prepare(sd,ed,years)
 @clients = Client.where("death_date between ? and ?",sd,ed)
 @by_years = clients.group_by {|c| c.death_date.year }
end

end
