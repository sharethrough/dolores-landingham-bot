require "rails_helper"

describe SlackUserFinder do
  describe "#user_exists?" do
    it "returns true if a user is found" do
      slack_username_from_fixture = "testusername"

      user_exists = SlackUserFinder.new(
        slack_username_from_fixture,
        Slack::Web::Client.new
      ).user_exists?

      expect(user_exists).to be true
    end

    it "returns false if a user was not found" do
      fake_slack_user_name = "testusernamethatdoesnotexist"

      user_exists = SlackUserFinder.new(
        fake_slack_user_name,
        Slack::Web::Client.new
      ).user_exists?

      expect(user_exists).to be false
    end
  end
end
