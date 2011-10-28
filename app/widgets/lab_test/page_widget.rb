class LabTest::PageWidget < Apotomo::Widget
  responds_to_event :updatePage, :with => :update

  def display
    @client = Client.find(session[:client_id]) unless session[:client_id].nil?
    @lab_tests = LabTest.page(params[:page])
 #   render :locals => {:lab_tests => @lab_tests}
    render({:state => :pages}, @lab_tests,params[:page])
  end

  def pages(lab_tests,page)
    render :locals => {:lab_tests => lab_tests}
  end


  def update

  end


end
