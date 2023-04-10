class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.references :neighborhood, null: false, foreign_key: true
      t.string :address, null: false
      t.string :website, null: false
    end
  end
end
