class Employee < ActiveRecord::Base
  validates :slack_username, presence: true, uniqueness: true, format: { with: /\A[a-z_0-9.]+\z/ }
  validates :started_on, presence: true
end
