require "rails_helper"

feature 'user edits a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do

# Acceptance Criteria
#
# [x] I must be able delete a question from the question edit page
# [x] I must be able delete a question from the question details page
# [x] All answers associated with the question must also be deleted

let!(:question) { Question.create!(title: 'NootnootnootNootnootnootNootnootnootNootnootnoot', description: "aa" * 150) }
let!(:answer_one) { Answer.create!(description: "answers" * 10, question_id: question.id) }
let!(:answer_two) { Answer.create!(description: "notanswers" * 10, question_id: question.id) }

  scenario "user deletes question from the edit page" do
    visit root_path
    click_link question.title
    click_link 'Edit'
    click_link 'Delete Question'
    expect(page).to have_content('Question Deleted')
  end

  scenario "user deletes question from the details page" do
    visit root_path
    click_link question.title
    click_link 'Delete Question'
    expect(page).to have_content('Question Deleted')
  end

  scenario "user deletes question and associated answers from the details page" do
    visit root_path
    click_link question.title
    click_link 'Delete Question'
    expect(page).not_to have_content(question.title)
  end

end
