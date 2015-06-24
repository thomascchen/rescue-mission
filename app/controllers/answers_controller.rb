class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:answer_id])
    @answer = @question.answer
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

      if @answer.save
        flash[:notice] = 'Answer saved!'
        redirect_to question_path(@question)
      else
        flash[:alert] = 'You ruined Christmas'
        redirect_to question_path(@question)
      end
  end


protected
def answer_params
  params.require(:answer).permit(:description, :question_id)
end



end
