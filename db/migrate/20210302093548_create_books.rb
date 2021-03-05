class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authur
      t.string :description
      t.integer :batch_number

      t.timestamps
    end
  end
end
