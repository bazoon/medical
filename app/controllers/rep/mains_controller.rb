class Rep::MainsController < ApplicationController

def ask_date
end

def prepare_clients
end


def report
  @sd=params[:start_date]
  @ed=params[:end_date]
  @sector_num = params[:sector_num]
  @years = years_array(@sd,@ed)
end


private

  def years_array(sd,ed)
    @start_year = Date.parse(sd).year
    @end_year = Date.parse(ed).year

    @years = []
    @start_year.upto(@end_year) {|y| @years << y }

    @years
  end


end
