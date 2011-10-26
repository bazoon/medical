class LabTest::ListWidget < Apotomo::Widget
 responds_to_event :newLabTest, :with => :redraw_list
  
  has_widgets do |root|
    root << widget('lab_test/form',:lab_test_form_widget)
  end


  def display
    @client=Client.find(params[:client_id])
    @lab_tests = @client.lab_tests
    render :locals => {:flash => options[:flash]}

  end

  def list(lab_tests)
    render :locals => {:lab_tests => lab_tests}
  end


  def redraw_list(evt)
   @client=Client.find(evt[:client_id])
   html = render({:state => :list}, @client.lab_tests)
   replace "##{widget_id}", :text => html
    
#   render :text => "alert('#{evt[:client_id]}');"
  end


end
