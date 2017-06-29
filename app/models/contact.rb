class Contact < ApplicationRecord
  def self.search(search)
    if Rails.env.production?
      where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone_number ILIKE ?", 
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR phone_number LIKE ?", 
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end
end
