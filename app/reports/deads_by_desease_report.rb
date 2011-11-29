class DeadsByDeseaseReport < BaseReport
 attr_accessor :by_reason_and_date, :by_years

def initialize(template)
 @template = template  
end

def h
 @template
end

def prepare(sd,ed,years,death_reports_presenter)
  @by_years = death_reports_presenter.by_years
  by_reasons = death_reports_presenter.clients.group_by {|c| c.death_reason.name }
  @by_reason_and_date = Hash.new
  by_reasons.each_pair do |key,item|
    @by_reason_and_date[key] = item.group_by {|client| client.death_date.year}
  end
end


def rel_row_value(items,totals)
 "#{((items.count.to_f / totals.to_f)*100).round(2)} %"unless items.nil?
end

def abs_row_value(items)
 items.count unless items.nil?
end

end
