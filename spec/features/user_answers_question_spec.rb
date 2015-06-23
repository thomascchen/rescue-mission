require "rails_helper"

feature 'user submits answer to question', %Q{
As a user
I want to answer another user's question
So that I can help them solve their problem
} do

let!(:question) { Question.create!(title: 'NootnootnootNootnootnootNootnootnootNootnootnoot', description: "aa" * 150) }

# Acceptance Criteria
#
# [x] I must be on the question detail page
# [x] I must provide a description that is at least 50 characters long
# [x] I must be presented with errors if I fill out the form incorrectly

  scenario 'visits question detail page, fills out form' do
    visit root_path
    click_link 'NootnootnootNootnootnootNootnootnootNootnootnoot'

    fill_in 'Description', with: 'answers' * 10

    click_button 'Submit'

    expect(page).to have_content('Answer saved')

    end

  scenario 'visits question detail page, fills out form' do
    visit root_path
    click_link 'NootnootnootNootnootnootNootnootnootNootnootnoot'

    click_button 'Submit'

    expect(page).to have_content('You ruined Christmas')
    end
end
