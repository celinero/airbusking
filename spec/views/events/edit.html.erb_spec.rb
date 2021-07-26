require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      user: nil,
      genre: nil,
      title: "MyString",
      description: "MyText",
      price: 1,
      sold: false
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[user_id]"

      assert_select "input[name=?]", "event[genre_id]"

      assert_select "input[name=?]", "event[title]"

      assert_select "textarea[name=?]", "event[description]"

      assert_select "input[name=?]", "event[price]"

      assert_select "input[name=?]", "event[sold]"
    end
  end
end
