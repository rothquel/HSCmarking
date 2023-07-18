class AddStatusToEssay < ActiveRecord::Migration[7.0]
  def change
    add_column :essays, :status, :integer, default: 1
    add_column :essays, :returned, :boolean, default: false
  end
end
