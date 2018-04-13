class RegisteredApp < ApplicationRecord

  belongs_to :user
  has_many :events

  scope :has_url, -> (url) { where(:url == url).first } 
end
