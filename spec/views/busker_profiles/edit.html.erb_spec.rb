require 'rails_helper'

RSpec.describe "busker_profiles/edit", type: :view do
  before(:each) do
    @busker_profile = assign(:busker_profile, BuskerProfile.create!(
      user: nil,
      name: "MyString",
      bio: "MyText"
    ))
  end

  it "renders the edit busker_profile form" do
    render

    assert_select "form[action=?][method=?]", busker_profile_path(@busker_profile), "post" do

      assert_select "input[name=?]", "busker_profile[user_id]"

      assert_select "input[name=?]", "busker_profile[name]"

      assert_select "textarea[name=?]", "busker_profile[bio]"
    end
  end
end
