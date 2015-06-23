class QuestionsController < ApplicationController
  def index
    @questions = questions
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  # Answer.where(question_id: params[:id])
    # if @answer.save
    #   flash[:notice] = 'Answer added!'
    #   redirect_to question_path
    # else
    #   flash[:error] = @answer.errors.full_messages.join(". ")
    #   render :show
    # end
  end

  def create
    @question = Question.new(question_params)
    @questions = questions
    if @question.save
      flash[:notice] = 'Question added!'
      redirect_to questions_path
    else
      flash[:error] = @question.errors.full_messages.join(". ")
      render :index
    end
  end

  private

  def questions
    Question.order(created_at: :desc)
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description)
  end

  # def answer_params
  #   params.require(:answer).permit(:description, :question_id)
  # end
end
