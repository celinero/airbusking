require 'rails_helper'

RSpec.describe "busker_profiles/index", type: :view do
  before(:each) do
    assign(:busker_profiles, [
      BuskerProfile.create!(
        user: nil,
        name: "Name",
        bio: "MyText"
      ),
      BuskerProfile.create!(
        user: nil,
        name: "Name",
        bio: "MyText"
      )
    ])
  end

  it "renders a list of busker_profiles" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
