require "spec_helper"

feature "user adds quantity for grocery list item" do
  scenario "quantity added when filled form submitted" do
    visit "/groceries"

    fill_in "Name", with: "coke zero"
    fill_in "Quantity", with: "5"
    click_on "Add"

    expect(page).to have_content("coke zero - 5")
  end

  scenario "redirect to error page if only quantity filled" do
    visit "/groceries"
    fill_in "Quantity", with: "5"
    click_on "Add"

    expect(page).to have_content("Please fill in all required fields!")
  end
end
