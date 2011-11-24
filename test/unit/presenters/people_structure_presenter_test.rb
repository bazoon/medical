require 'test_helper'

class PeopleStructurePresenterTest < ActionView::TestCase
  

  test "should do smth" do

    client = FactoryGirl.create(:client)

    assert client.name == "Ivan", true

  end


end
