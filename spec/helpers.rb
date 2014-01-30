require_relative '../lib/shipit2'
module Helpers
  def cleanup_test_versions
    config = ShipIt2::JiraConfig.new

    options = {
      :username => config.jira_user,
      :password => config.jira_password,
      :site     => config.jira_url,
      :context_path => "/",
      :auth_type => :basic
    }

    client = JIRA::Client.new(options)

    project = client.Project.find("UAR")

    versions_to_delete = [
      "testversion1234",
      "testingbuild86",
      "testingrelease17"
    ]
    project.versions.each do |version|
      if versions_to_delete.include? version.name
        version.delete
      end
    end
  end

  def version_exist?(version_to_check)
    config = ShipIt2::JiraConfig.new

    options = {
      :username => config.jira_user,
      :password => config.jira_password,
      :site     => config.jira_url,
      :context_path => "/",
      :auth_type => :basic
    }

    client = JIRA::Client.new(options)

    project = client.Project.find("UAR")

    version_exists = false

    project.versions.each do |jira_version|
      if version_to_check == jira_version.name
        version_exists = true
        break
      end
    end
    return version_exists
  end
end
