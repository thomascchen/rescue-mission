class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added!'
      redirect_to questions_path
    else
      render :index
    end
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
