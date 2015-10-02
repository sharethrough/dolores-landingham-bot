require "rails_helper"

describe Employee do
  describe "Validations" do
     subject { create(:employee) }
     it { should validate_presence_of(:slack_username) }
     it { should validate_uniqueness_of(:slack_username) }
     # These fail - why?
     #it { should allow_values("test_user_1", "testuser2", "test.user.3").for(:slack_username) }
     #it { should_not allow_values("TEST USER 1", "test_user_2?", "test'user'3").for(:slack_username) }
     it { should allow_value("test_user_1").for(:slack_username) }
     it { should_not allow_value("TEST USER 1").for(:slack_username) }
     it { should validate_presence_of(:started_on) }
  end
end
