require 'rails_helper'

feature 'user views question\'s details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do
  let!(:question) { Question.create!(title: 'NootnootnootNootnootnootNootnootnootNootnootnoot', description: "aa" * 150) }
  # Acceptance Criteria
  #
  # [x] I must be able to get to this page from the questions index
  # [x] I must see the question's title
  # [x] I must see the question's description

  scenario 'visits index, clicks on question, sees details page' do
    visit questions_path
    click_link 'NootnootnootNootnootnootNootnootnootNootnootnoot'

    expect(page).to have_content('NootnootnootNootnootnootNootnootnootNootnootnoot')
    expect(page).to have_content('aa' * 150)
  end
end
