require "application_system_test_case"

class TeachersTest < ApplicationSystemTestCase
  setup do
    @my_teacher = my_teachers(:one)
  end

  test "visiting the index" do
    visit my_teachers_url
    assert_selector "h1", text: "Teachers"
  end

  test "creating a Teacher" do
    visit my_teachers_url
    click_on "New Teacher"

    click_on "Create Teacher"

    assert_text "Teacher was successfully created"
    click_on "Back"
  end

  test "updating a Teacher" do
    visit my_teachers_url
    click_on "Edit", match: :first

    click_on "Update Teacher"

    assert_text "Teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher" do
    visit my_teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher was successfully destroyed"
  end
end
