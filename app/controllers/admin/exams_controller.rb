class Admin::ExamsController < ApplicationController

  def destroy
    @exam = Exam.find params[:id]
    @exam.destroy
    flash[:success] = t :success_flash
    redirect_to request.referrer || admin_subjects_path 
  end

  def show    
    @exam = Exam.find params[:id]
    @questions = @exam.questions
  end
 
end
