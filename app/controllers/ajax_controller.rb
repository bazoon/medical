class AjaxController < ApplicationController

 def clients
    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      clients = Client.where("surname like ?", like)
    else
      clients = Client.all
    end
    list = clients.map {|u| Hash[ id: u.id, label: u.fio, name: u.surname]}
    render json: list

 end


end
