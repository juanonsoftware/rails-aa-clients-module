module ModuleClients
  class Client < ApplicationRecord
    include RansackSearchable
    
    self.table_name = 'clients_management_clients'

    belongs_to :admin_user, class_name: 'AdminUser', foreign_key: :admin_user_id

    has_many :domains, class_name: 'ModuleClients::Domain', foreign_key: :client_id
    accepts_nested_attributes_for :domains, allow_destroy: true

    validates :admin_user, presence: true, uniqueness: true

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 128 }
    validates :contact_email, 'valid_email_2/email': true
    validates :contact_phone_number, phone: { possible: true, allow_blank: true }
  end
end
