require 'test_helper'

class LabTest::CountWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:count)
  end
  
  test "display" do
    render_widget :count
    assert_select "h1"
  end
end
