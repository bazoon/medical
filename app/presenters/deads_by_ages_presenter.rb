class DeadsByAgesPresenter
 attr_accessor :by_age_and_date, :by_years

def initialize(template)
 @template = template  
end

 def h
   @template
 end


def prepare(sd,ed,years,death_reports_presenter)
  @by_years = death_reports_presenter.by_years
  
  by_ages = death_reports_presenter.clients.group_by do |c|
  age = (c.death_date - c.birth_date)/365.25

    case age
       when 0..59 then "till 60"
       when 60..69 then "60 - 69"
       when 70..79 then "70 -79"
       when 80..89 then "80 - 89"
       else ">90"
    end

  end

  @by_age_and_date = Hash.new

  by_ages.each_pair do |key,item|
    @by_age_and_date[key] = item.group_by {|client| client.death_date.year }
  end

end


def rel_row_value(items,totals)
"#{((items.count.to_f / totals.to_f)*100).round(2)} %"unless items.nil?
end

def abs_row_value(items)
 items.count unless items.nil?
end


end
