class AddingClientDomainsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :clients_management_domains do |t|
      t.string :name, null: false, limit: 255
      t.index :name, unique: true
    
      t.boolean :is_active, null: false, default: false

      t.references :client, null: false, foreign_key: { to_table: :clients_management_clients }
      
      t.timestamps
    end
  end
end
