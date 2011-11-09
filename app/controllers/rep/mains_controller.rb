class Rep::MainsController < ApplicationController

def ask_date
  
end

def deads_by_deseases
  @sd=params[:start_date]
  @ed=params[:end_date]

  @clients = Client.where("death_date between ? and ?",@sd,@ed)

  @years = [2010,2011]

  @a=Hash.new
  @des = @clients.group_by {|c| c.death_reason.name }


  @des.each_pair do |key,item|
    @a[key] = item.group_by {|client| client.death_date.year}
  end

  
end  


end
