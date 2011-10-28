class LabTest::ListWidget < Apotomo::Widget
 responds_to_event :newLabTest, :with => :redraw_list
 responds_to_event :delete, :with => :delete
  
  has_widgets do |root|
    root << widget('lab_test/form',:lab_test_form_widget)
    root << widget('lab_test/count',:lab_test_count_widget)
    root << widget('lab_test/page',:lab_test_page_widget)
  end


  def display
    @client = Client.find(params[:client_id])
    @lab_tests = @client.lab_tests.page(params[:page]).per(10)

    trigger(:updatePage,:lab_tests => @lab_tests,:page => params[:page] )



    render({:state => :list}, @lab_tests)
  end

  def list(lab_tests)
    render :locals => {:lab_tests => lab_tests}
  end


  def redraw_list(evt)
   @client=Client.find(evt[:client_id])
   html = render({:state => :list}, @client.lab_tests.page(1))
   trigger(:updateCount,:count => @client.lab_tests.count)
   replace "##{widget_id}", :text => html
  end




  def delete(evt)
    @lab_test =LabTest.find(evt[:lab_test_id])
    @lab_test.destroy
    render({:state => :redraw_list}, :client_id => @lab_test.client_id)
  end

end
