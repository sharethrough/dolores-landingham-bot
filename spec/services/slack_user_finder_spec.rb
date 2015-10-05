require "rails_helper"

describe SlackUserFinder do
  describe "#user_exists?" do
    it "returns true if a user is found" do
      slack_username_from_fixture = "testusername"

      user = SlackUserFinder.new(
        slack_username_from_fixture,
        Slack::Web::Client.new
      )

      expect(user).to be_user_exists
    end

    it "returns false if a user was not found" do
      fake_slack_user_name = "testusernamethatdoesnotexist"

      user = SlackUserFinder.new(
        fake_slack_user_name,
        Slack::Web::Client.new
      )

      expect(user).not_to be_user_exists
    end
  end
end
