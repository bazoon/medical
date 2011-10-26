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
    params[:client_id] = @lab_test.client_id

    if @lab_test.update_attributes(evt[:lab_test])
     trigger(:newLabTest,:client_id => @lab_test.client_id,:lab_tests => @lab_test)
     replace :state => :display
    else
     errors="" 
     @lab_test.errors.full_messages.each {|e| errors=errors+e}
     render :text => "alert('#{errors}');"
    end





  end


end
