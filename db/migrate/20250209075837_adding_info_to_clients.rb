class AddingInfoToClients < ActiveRecord::Migration[7.2]
  def change
    change_table :clients_management_clients do |t|
      t.string :contact_email
      t.string :contact_phone_number
      t.text :details
    end
  end
end
