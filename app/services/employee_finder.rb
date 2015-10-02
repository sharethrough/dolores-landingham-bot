require "slack-ruby-client"

class EmployeeFinder
  def initialize
    configure_slack
  end

  def employee_exists?(slack_username)
    SlackUserFinder.new(slack_username, client).user_exists?
  end

  private

  def configure_slack
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end
  end

  def client
    @client ||= Slack::Web::Client.new
  end
end
