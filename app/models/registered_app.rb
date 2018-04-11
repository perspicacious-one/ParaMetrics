class RegisteredApp < ApplicationRecord

  belongs_to :user
  has_many :events
  
  scope :belongs_to_current, -> (user) { where(user: user) }

  def to_param
     [self.id, self.name.parameterize].join("-")
  end

end
