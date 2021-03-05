class CreateBookingCards < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :renew_date
      t.string :return_date

      t.timestamps
    end
  end
end
