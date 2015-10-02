require "rails_helper"

describe EmployeeFinder do
  describe "#employee_exists?" do
    it "returns true if an employee exists in Slack" do
      employee = create(:employee)
      client_double = Slack::Web::Client.new
      slack_user_finder_double = double(users_exists?: true)

      allow(Slack::Web::Client).to receive(:new).and_return(client_double)
      allow(SlackUserFinder).
        to receive(:new).with(employee.slack_username, client_double).
        and_return(slack_user_finder_double)

      employee_exists = EmployeeFinder.new.employee_exists?(employee.slack_username)

      expect(employee_exists).to be true
    end

    it "returns false if an employee does not exist in Slack" do
      employee = create(:employee)
      client_double = Slack::Web::Client.new
      slack_user_finder_double = double(users_exists?: false)

      allow(Slack::Web::Client).to receive(:new).and_return(client_double)
      allow(SlackUserFinder).
        to receive(:new).with(employee.slack_username, client_double).
        and_return(slack_user_finder_double)

      employee_exists = EmployeeFinder.new.employee_exists?(employee.slack_username)

      expect(employee_exists).to be false
    end
  end
end
