class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string     :postal_code, null: false
      t.integer    :area_id, null: false
      t.string     :house_number, null: false
      t.string     :building
      t.string     :tel_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
