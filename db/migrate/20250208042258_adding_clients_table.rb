class AddingClientsTable < ActiveRecord::Migration[7.2]
  def change
    create_table :clients_management_clients do |t|
      t.string :name, null: false, limit: 128
      t.index :name, unique: true
    
      t.boolean :is_active, null: false, default: false

      t.references :admin_user, null: false, foreign_key: { to_table: :admin_users }, index: { unique: true }
      
      t.timestamps
    end
  end
end
