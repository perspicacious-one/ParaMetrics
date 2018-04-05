class RegisteredApp < ApplicationRecord

  belongs_to :user

  scope :belongs_to_current, -> { where(user: current_user) }
end
