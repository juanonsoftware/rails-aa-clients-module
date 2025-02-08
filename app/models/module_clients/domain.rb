module ModuleClients
  class Domain < ApplicationRecord
    include RansackSearchable
    
    self.table_name = 'clients_management_domains'

    belongs_to :client, class_name: 'ModuleClients::Client', foreign_key: 'client_id'

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  end
end
