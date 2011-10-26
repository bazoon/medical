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


   def mkb_types
    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      mkb_types = Ref::MkbType.where("code like ?", like)
    else
      mkb_types = Ref::MkbType.all
    end
    list = mkb_types.map {|m| Hash[ id: m.id, label: "#{m.code} #{m.name}", name: m.code]}
    render json: list
     
   end


  def prof_inspections_by_year
    @client=Client.find(params[:client_id])
    @year=params[:year]

    start_date=Date.new(@year.to_i,1,1)
    end_date=Date.new(@year.to_i,12,31)
    @prof_inspections=@client.prof_inspections.where("actual_date between ? and ?",start_date,end_date)
    @lab_tests=@client.lab_tests.where("test_date between ? and ?",start_date,end_date).prof_inspection_minimum 
    @diagnostic_tests=@client.diagnostic_tests.where("test_date between ? and ?",start_date,end_date).prof_inspection_minimum 

    respond_to do |format|
      format.js 
    end
  end



  def lab_test_form
    @client=Client.find(params[:client_id])
    @lab_test=LabTest.new
  end


end
