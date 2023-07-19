class AddFieldsToEssayModel < ActiveRecord::Migration[7.0]
  def change
    add_column :essays, :question, :string
    add_column :essays, :mark, :integer
    add_column :essays, :notes, :string
    add_column :essays, :primarydoc, :string
    add_column :essays, :secondarydoc, :string
  end
end
