require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.new(title: "Question title Question title Question title",
                                description: "This is a description This is a description This is a description This is a description This is a description This is a description This is a description This is a description") }

  it 'has a title' do
    expect(question.title).to eq("Question title Question title Question title")
  end

  it 'has at least 40 characters in the title' do
    expect(question.title.length).to be >= 40
  end

  it 'has a description' do
    expect(question.description).to eq("This is a description This is a description This is a description This is a description This is a description This is a description This is a description This is a description")
  end

  it 'has at least 150 characters in the description' do
    expect(question.description.length).to be >= 150
  end
end
