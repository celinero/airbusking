require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        user: nil,
        genre: nil,
        title: "Title",
        description: "MyText",
        price: 2,
        sold: false
      ),
      Event.create!(
        user: nil,
        genre: nil,
        title: "Title",
        description: "MyText",
        price: 2,
        sold: false
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
