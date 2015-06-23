require 'rails_helper'

feature 'user views a question\'s answers', %Q{
  As a user
  I want to view the answers for a question
  So that I can learn from the answer
} do

  let!(:question) { Question.create!(title: 'NootnootnootNootnootnootNootnootnootNootnootnoot', description: "aa" * 150) }
  let!(:answer_one) { Answer.create!(description: "answers" * 10, question_id: question.id) }
  let!(:answer_two) { Answer.create!(description: "notanswers" * 10, question_id: question.id) }
  # Acceptance Criteria
  #
  # [x] I must be on the question detail page
  # [x] I must only see answers to the question I'm viewing
  # [x] I must see all answers listed in order, most recent last

  scenario 'visits index, clicks on question, sees answers on details page' do

    visit questions_path
    click_link 'NootnootnootNootnootnootNootnootnootNootnootnoot'

    expect(page).to have_content(answer_one.description)
    expect(page).to have_content(answer_two.description)
  end
end
