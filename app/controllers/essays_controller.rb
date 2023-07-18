class EssaysController < ApplicationController
  def new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)
    @essay.save
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
