class Essay < ApplicationRecord
  belongs_to :student
  has_one_attached :primarydoc
  has_one_attached :secondarydoc

  def add_48_hours(created_at)
    # Convert the date_created to a DateTime object
    future_date_time = created_at + 48.hours

    # Return the resulting date and time
    future_date_time
  end

  def status_label(status)
    if status == 1
      return '<span class="badge bg-success">In the queue</span>'.html_safe
    elsif status == 2
      return '<span class="badge bg-danger">With a marker 🎉</span>'.html_safe
    end
  end
end
