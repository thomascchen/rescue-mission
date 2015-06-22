require 'rails_helper'

feature 'user views questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
  let!(:question) { FactoryGirl.create(:question, title: 'I was wondering about at thing stuff and other things') }
  let!(:another_question) { FactoryGirl.create(:question) }

  # Acceptance Criteria
  #
  # [x] I must see the title of each question
  # [x] I must see questions listed in order, most recently posted first

  scenario 'visits index and sees the title of each question' do
    visit questions_path

    expect(page).to have_content('I was wondering about at thing stuff and other things')
  end
end
