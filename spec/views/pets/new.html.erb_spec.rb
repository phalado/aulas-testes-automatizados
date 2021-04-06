require 'rails_helper'

RSpec.describe "pets/new", type: :view do
  before(:each) do
    assign(:pet, Pet.new(
      name: "MyString",
      pet_type: 1,
      age: 1,
      user: nil,
      famous_reference: "MyString"
    ))
  end

  it "renders new pet form" do
    render

    assert_select "form[action=?][method=?]", pets_path, "post" do

      assert_select "input[name=?]", "pet[name]"

      assert_select "input[name=?]", "pet[pet_type]"

      assert_select "input[name=?]", "pet[age]"

      assert_select "input[name=?]", "pet[user_id]"

      assert_select "input[name=?]", "pet[famous_reference]"
    end
  end
end
