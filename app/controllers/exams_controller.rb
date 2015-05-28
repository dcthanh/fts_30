class ExamsController < ApplicationController
  before_action :authenticate_user!, :correct_user!

  before_filter :load_subject

  def new
    @exam = @subject.exams.build
  end

  def create
    @exam = @subject.exams.build  exam_params
    @exam.user_id = current_user.id
    if @exam.save
      flash[:success] = t :success_flash
      redirect_to @subject
    else
      render :new
    end
  end

  def show
    @exam = exam.find params[:id]
  end

  def edit
    @exam = exam.find params[:id]
  end

  def update
    @exam = exam.find params[:id]
    if @exam.update_attributes exam_params
      flash[:success] = t :update_flash
      redirect_to [@subject, @exam]
    end
  end

  private
    def exam_params
      params.require(:exam).permit  :id, :exam_id, :user_id, :status, result_attributes: [:id, :option_id, :content]
    end

    def correct_user!
      @exam = current_user.exams.find_by id: params[:id]
      redirect_to root_url if @exam.nil?
    end

    def load_subject
      @subject = subject.find params[:subject_id]
    end
end
