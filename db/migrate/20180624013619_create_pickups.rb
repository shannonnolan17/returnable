class CreatePickups < ActiveRecord::Migration[5.1]
  def change
    create_table :pickups do |t|
      t.string   :email
      t.string   :company
      t.string   :name
      t.string   :phone
      t.string   :residential
      t.string   :addressLines
      t.string   :cityTown
      t.string   :stateProvince
      t.string   :postalCode
      t.string   :countryCode
      t.string   :carrier
      t.string   :packageLocation
      t.string   :specialInstructions


      t.timestamps
    end
  end
end
