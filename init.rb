require 'redmine'

config.to_prepare do
  require_dependency 'issues_controller_patch'
  require_dependency 'issue_moves_controller_patch'
end

Redmine::Plugin.register :redmine_issue_lockdown do
  name 'Redmine Issue Lockdown plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

