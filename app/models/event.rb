class Event < ApplicationRecord
  belongs_to :registered_app

  scope :most_recent, -> (max) { order(created_at: :desc).where("created_at" => (Date.today - 7)) }
end
