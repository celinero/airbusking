require 'rails_helper'

RSpec.describe "busker_profiles/show", type: :view do
  before(:each) do
    @busker_profile = assign(:busker_profile, BuskerProfile.create!(
      user: nil,
      name: "Name",
      bio: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
