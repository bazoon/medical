class Rep::MainsController < ApplicationController

def ask_date

end

def prepare_clients
  

end


def deads_by_deseases
  @sd=params[:start_date]
  @ed=params[:end_date]
  @years = years_array(@sd,@ed)
  @clients = Client.where("death_date between ? and ?",@sd,@ed)
  
  @by_years = @clients.group_by {|c| c.death_date.year}


  @by_reasons = @clients.group_by {|c| c.death_reason.name }

  @by_reason_and_date = Hash.new

  @by_reasons.each_pair do |key,item|
    @by_reason_and_date[key] = item.group_by {|client| client.death_date.year}
  end

end

def deads_by_ages
  @sd=params[:start_date]
  @ed=params[:end_date]
  @years = years_array(@sd,@ed)
  @clients = Client.where("death_date between ? and ?",@sd,@ed)

  @by_years = @clients.group_by {|c| c.death_date.year}

  @by_ages = @clients.group_by do |c|
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

  @by_ages.each_pair do |key,item|
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
