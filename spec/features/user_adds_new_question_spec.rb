require 'rails_helper'

feature 'user fills out form to add new question', %Q{
  As a user
I want to post a question
So that I can receive help from others
} do

# Acceptance Criteria
#
# [] I must provide a title that is at least 40 characters long
# [] I must provide a description that is at least 150 characters long
# [] I must be presented with errors if I fill out the form incorrectly

  scenario 'visits index fills out form, adds question' do
    question_title = "This is the best question title. It is tooooooooootally long enough.............."
    visit questions_path

    fill_in 'Title', with: question_title
    fill_in 'Description', with: "So this one time I went to the beach and it was really warm so I went swimming and there were jellyfish and one stung me in the face and it hurt a lot."

    click_button 'Submit'

    expect(page).to have_content('Question added!')
    expect(page).to have_content(question_title)
  end

  scenario 'visits index and submits invalid info' do
    visit questions_path
    click_button 'Submit'

    expect(page).to have_content('is too short')
  end
end
