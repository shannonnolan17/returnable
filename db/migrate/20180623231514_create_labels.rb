class CreateLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :labels do |t|
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


      t.timestamps
    end
  end
end
