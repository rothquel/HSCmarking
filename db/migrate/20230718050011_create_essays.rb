class CreateEssays < ActiveRecord::Migration[7.0]
  def change
    create_table :essays do |t|

      t.timestamps
    end
  end
end
