class EssaysController < ApplicationController
  def new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)
    @essay.student = current_student
    @essay.save
    if @essay.save
      redirect_to essay_path(@essay)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @essays = Essay.where(student_id: current_student.id)
  end

  def show
    @essay = Essay.find(params[:id])
  end

  private

  def essay_params
    params.require(:essay).permit(:subject, :title)
  end
end
