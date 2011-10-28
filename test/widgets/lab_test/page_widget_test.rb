require 'test_helper'

class LabTest::PageWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:page)
  end
  
  test "display" do
    render_widget :page
    assert_select "h1"
  end
end
