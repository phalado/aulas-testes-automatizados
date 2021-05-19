require 'rails_helper'

RSpec.describe "pets/index", type: :view do
  before(:each) do
    assign(:pets, [
      Pet.create!(
        name: "Name",
        pet_type: 2,
        age: 3,
        user: nil,
        famous_reference: "Famous Reference"
      ),
      Pet.create!(
        name: "Name",
        pet_type: 2,
        age: 3,
        user: nil,
        famous_reference: "Famous Reference"
      )
    ])
  end

  it "renders a list of pets" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Famous Reference".to_s, count: 2
  end
end
