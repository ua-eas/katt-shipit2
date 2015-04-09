require 'yaml'
require 'jira'

require 'shipit2/base'
require 'shipit2/config'
require 'shipit2/jira'
require 'shipit2/jira_config'
require 'shipit2/project'
require 'shipit2/uar_project'

module ShipIt2

  def get_jira_client_config
    ShipIt2::JiraConfig.new
  end

  class ShipIt2::NotImplementedError < StandardError
  end

end
