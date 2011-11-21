class InvalidsPresenter
  attr_accessor :by_mse_reason_and_year, :by_years

  attr_reader :test

def initialize(template)
 @template = template  
end

def h
 @template
end

def prepare(sd,ed)  
  war_invalids = Client.includes(:mses,:benefits).where("benefits.benefit_category_id=? and mses.send_date between ? and ? and reason in (?)",Ref::BenefitCategory.war_invalid_id,sd,ed,[5,6,7])





  all_mses=[]

  war_invalids.each do |c|
   c.mses.each {|m| all_mses << m}
  end

  by_mse_reasons = all_mses.group_by do |mse|
    
    case mse.reason
       when 5 then "3 -> 1"
       when 6 then "2 -> 1"
       when 7 then "3 -> 2"
       else "ERRROR #{mse.reason} | #{mse.client.fio}"
    end

  end
    
    
 @by_years = all_mses.group_by {|m| m.send_date.year }

  @by_mse_reason_and_year=Hash.new

  by_mse_reasons.each_pair do |key,item|
   @by_mse_reason_and_year[key] = item.group_by {|m| m.send_date.year }
  end


 @test = @by_mse_reason_and_year


end


def rel_row_value(items,totals)
 "#{((items.count.to_f / totals.count.to_f)*100).round(2)} %"unless items.nil? or totals.nil?
end

def abs_row_value(items)
 items.count unless items.nil?
end

end
