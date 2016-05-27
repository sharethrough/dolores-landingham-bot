Rails.application.config.middleware.use OmniAuth::Builder do
  GITHUB_TEAM_ID = ENV.fetch('GITHUB_TEAM_ID')
  provider :githubteammember,
    ENV['GITHUB_CLIENT_ID'],
    ENV['GITHUB_CLIENT_SECRET'],
    scope: 'read:org',
    teams: {
      "team_member?" => GITHUB_TEAM_ID.to_I
    }
end
