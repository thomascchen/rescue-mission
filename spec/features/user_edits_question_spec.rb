require "rails_helper"

feature 'user edits a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do

  # Acceptance Criteria
  #
  # [x] I must provide valid information
  # [x] I must be presented with errors if I fill out the form incorrectly
  # [x] I must be able to get to the edit page from the question details page

let!(:question) { Question.create!(title: 'NootnootnootNootnootnootNootnootnootNootnootnoot', description: "aa" * 150) }

  scenario "user visits edit page" do
    visit root_path
    click_link question.title
    click_link 'Edit'
    expect(page).to have_content('Edit a Question')
  end

  scenario "user edits question with valid information" do
    visit root_path
    click_link question.title
    click_link 'Edit'
    fill_in 'Title', with: question.title + "changes"
    click_button 'Submit'
    expect(page).to have_content('changes')
  end

  scenario 'user attempts to edit question with invalid information' do
    visit root_path
    click_link question.title
    click_link 'Edit'
    fill_in 'Title', with: ''
    click_button 'Submit'
    expect(page).to have_content('is too short')
  end
end
