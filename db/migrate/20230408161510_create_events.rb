class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.references :venue, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :website
    end
  end
end
