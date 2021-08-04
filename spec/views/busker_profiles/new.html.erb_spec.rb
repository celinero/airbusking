require 'rails_helper'

RSpec.describe "busker_profiles/new", type: :view do
  before(:each) do
    assign(:busker_profile, BuskerProfile.new(
      user: nil,
      name: "MyString",
      bio: "MyText"
    ))
  end

  it "renders new busker_profile form" do
    render

    assert_select "form[action=?][method=?]", busker_profiles_path, "post" do

      assert_select "input[name=?]", "busker_profile[user_id]"

      assert_select "input[name=?]", "busker_profile[name]"

      assert_select "textarea[name=?]", "busker_profile[bio]"
    end
  end
end
