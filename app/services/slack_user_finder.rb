class SlackUserFinder < SlackApiWrapper
  def user_exists?
    !slack_user.nil?
  end
end
