class AddForeignKeyToEssays < ActiveRecord::Migration[7.0]
  def change
    add_reference :essays, :student, foreign_key: true
  end
end
