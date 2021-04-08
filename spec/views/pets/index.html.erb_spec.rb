require 'rails_helper'

RSpec.describe "pets/index", type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    @pets = assign(:pets, create_list(:pet, 5, name: "Name", pet_type: 2, age: 3, owner: user))
  end

  it "renders a list of pets" do
    render
    assert_select "tr>td", text: "Name", count: 5
    assert_select "tr>td", text: "mouse".to_s, count: 5
    assert_select "tr>td", text: 3.to_s, count: 5
    assert_select "tr>td", text: user.id.to_s, count: 5
    assert_select "tr>td", text: "Mickey".to_s, count: 5
  end
end
