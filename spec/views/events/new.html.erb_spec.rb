require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      user: nil,
      genre: nil,
      title: "MyString",
      description: "MyText",
      price: 1,
      sold: false
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[user_id]"

      assert_select "input[name=?]", "event[genre_id]"

      assert_select "input[name=?]", "event[title]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[sold]"
    end
  end
end
