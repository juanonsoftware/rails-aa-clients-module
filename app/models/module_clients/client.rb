module ModuleClients
  class Client < ApplicationRecord
    include RansackSearchable
    
    self.table_name = 'clients_management_clients'

    belongs_to :admin_user, class_name: 'AdminUser', foreign_key: 'admin_user_id'

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 128 }
    validates :admin_user, presence: true, uniqueness: true
  end
end
