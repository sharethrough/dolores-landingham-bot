class Employee < ActiveRecord::Base
  validates :slack_username, presence: true, uniqueness: true, format: { with: /\A[a-z_0-9.]+\z/, message: "Slack usernames can only contain lowercase letters, numbers, underscores, and periods." }
  validates :started_on, presence: true

  validate :slack_user_exists

  def slack_user_exists
    errors.add(
      :slack_username,
      "\"#{self[:slack_username]}\" is not a valid employee (that username was not found)."
    ) unless EmployeeFinder.new.employee_exists?(self[:slack_username])
  end
end
