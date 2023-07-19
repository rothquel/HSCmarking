class EssaysController < ApplicationController
  def new
    @essay = Essay.new
  end

  def create
    @essay = Essay.new(essay_params)
    @essay.student = current_student
    @essay.save
    if @essay.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: 'HSCmarking.com.au Essay Marking',
          amount: 1000,  # Replace with the actual price for the essay
          currency: 'aud',
          quantity: 1
        }],
        success_url: essay_url(@essay),
        cancel_url: new_essay_url
      )
      redirect_to session.url, allow_other_host: true
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
    params.require(:essay).permit(:subject, :title, :question, :mark, :notes, :primarydoc, :secondarydoc)
  end

  def attach_file(essay, file)
    return unless file

    essay.primarydoc.attach(file)
  end
end
