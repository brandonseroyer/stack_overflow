class QuestionsController < ApplicationController
  before_action :find_question, except: [:index, :new, :create]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to  questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question= Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      redirect_to questions_path
    end

  private
  def question_params
    params.require(:question).permit(:question, :author)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
