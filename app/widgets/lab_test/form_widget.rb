class LabTest::FormWidget < Apotomo::Widget
 responds_to_event :submit, :with => :process_form


  def display
    @client=Client.find(params[:client_id])
    @lab_test = LabTest.new
    render 
  end


 #  render :text => "alert('#{evt.data.inspect}');"
 #  render :text => "alert('#{@lab_test.inspect}');"
  #

  def process_form(evt)
    @lab_test = LabTest.new(evt[:lab_test])
    @client = Client.find(evt[:lab_test][:client_id])
    params[:client_id] = @client.id

    if @lab_test.update_attributes(evt[:lab_test])
     trigger(:newLabTest,:client_id => @lab_test.client_id)
     replace :state => :display
    else
      replace :view => :display
    end
  end


end
