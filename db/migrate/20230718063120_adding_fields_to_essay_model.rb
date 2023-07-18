class AddingFieldsToEssayModel < ActiveRecord::Migration[7.0]
  def change
    add_column :essays, :subject, :string
    add_column :essays, :title, :string
    add_column :essays, :returnedon, :datetime
  end
end
