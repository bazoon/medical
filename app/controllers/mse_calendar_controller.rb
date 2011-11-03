class MseCalendarController < ApplicationController


def show
  

end


def events
  @events = Mse.scoped  
  @events = @events.after(params['start']) if (params['start'])
  @events = @events.before(params['end']) if (params['end'])
  
  respond_to do |format|
    format.xml  { render :xml => @events }
    format.js  { render :json => @events }
  end
end  

end
