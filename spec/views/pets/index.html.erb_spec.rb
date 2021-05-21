require 'rails_helper'

RSpec.describe "pets/index", type: :view do
  let!(:user) { create(:user) }

  context 'get page\'s fix elements' do
    before(:example) do
      @pets = assign(:pets, create_list(:pet, 1, name: "Pet Name", pet_type: 2, age: 9, owner: user))
      render
    end

    it "render page title" do
      assert_select "h1", text: "Pets"
    end

    it "render table header" do
      assert_select "table > thead > tr > th", text: "Name"
      assert_select "table > thead > tr > th", text: "Pet type"
      assert_select "table > thead > tr > th", text: "Age"
      assert_select "table > thead > tr > th", text: "User"
      assert_select "table > thead > tr > th", text: "Famous reference"
    end

    it "render links" do
      assert_select "a", text: "New Pet", href: 'new_pet_path'
    end
  end

  context 'get pets elements' do
    before(:example) do
      @pets = assign(:pets, create_list(:pet, 5, name: "Pet Name", pet_type: 2, age: 9, owner: user))
      render
    end

    it "renders a list of pets" do
      assert_select "table > tbody > tr > td", text: "Pet Name", count: 5
      assert_select "table > tbody > tr > td", text: "mouse".to_s, count: 5
      assert_select "table > tbody > tr > td", text: 9.to_s, count: 5
      assert_select "table > tbody > tr > td", text: user.id.to_s, count: 5
      assert_select "table > tbody > tr > td", text: "Mickey".to_s, count: 5
    end

    it "render links" do
      assert_select "table > tbody > tr > td > a", text: "Show", href: 'pet_path'
      assert_select "table > tbody > tr > td > a", text: "Edit", href: 'edit_pet_path', method: :patch
      assert_select "table > tbody > tr > td > a", text: "Destroy", href: 'pet_path', method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
