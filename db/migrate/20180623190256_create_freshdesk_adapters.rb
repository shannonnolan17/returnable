class CreateFreshdeskAdapters < ActiveRecord::Migration[5.1]
  def change
    create_table :freshdesk_adapters do |t|

      t.timestamps
    end
  end
end
