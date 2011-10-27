class LabTest::CountWidget < Apotomo::Widget
  responds_to_event :updateCount, :with => :update, :passing => :root
  responds_to_event :highlight, :with => :highlight

  def display
    @client = Client.find(params[:client_id])
    render({:state => :count}, @client.lab_tests.count)
  end


  def count(c)
    render :locals => {:count => c}
  end

  def update(evt)
   html = render({:state => :count}, evt[:count])
#   trigger(:highlight)
   text = replace "##{widget_id}", :text => html
   text = text + "$('##{widget_id}').effect('pulsate'); "
   render :text => text

  end


  def highlight
   render :text => "$('#lab_test_list_widget').effect('pulsate'); "
  end

end
