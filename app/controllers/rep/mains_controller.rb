class Rep::MainsController < ApplicationController

def ask_date

end

def prepare_clients
end




def invalids_report
  @sd=params[:start_date]
  @ed=params[:end_date]
  @years = years_array(@sd,@ed)

  @war_invalids = Client.includes(:mses,:benefits).where("benefits.benefit_category_id=? and mses.send_date between ? and ? and reason in (?)",Ref::BenefitCategory.war_invalid_id,@sd,@ed,[5,6,7])

  all_mses=[]

  @war_invalids.each do |c|
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


 # render :text => @by_mse_reason_and_year.inspect
end

def death_reports
  @sd=params[:start_date]
  @ed=params[:end_date]
  clients = Client.where("death_date between ? and ?",@sd,@ed)
  @years = years_array(@sd,@ed)
  @by_years = clients.group_by {|c| c.death_date.year }

  #render :text => @by_years.inspect
  deads_by_deseases(clients)
  deads_by_ages(clients)
end


def deads_by_deseases(clients)
  by_reasons = clients.group_by {|c| c.death_reason.name }
  @by_reason_and_date = Hash.new
  by_reasons.each_pair do |key,item|
    @by_reason_and_date[key] = item.group_by {|client| client.death_date.year}
  end
end


def deads_by_ages(clients)
  by_ages = clients.group_by do |c|
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


# render :text =>@by_age_and_date.inspect

end



private

  def years_array(sd,ed)
    @start_year = Date.parse(sd).year
    @end_year = Date.parse(ed).year

    @years = []
    @start_year.upto(@end_year) {|y| @years << y}

    @years
  end


end
