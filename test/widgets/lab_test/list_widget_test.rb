require 'test_helper'

class LabTest::ListWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:list)
  end
  
  test "display" do
    render_widget :list
    assert_select "h1"
  end
end
