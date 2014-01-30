require 'yaml'
require 'active_support/core_ext'
require 'jira'
require 'require_all'

module ShipIt2

  def get_jira_client_config
    ShipIt2::JiraConfig.new
  end

  class ShipIt2::NotImplementedError < StandardError
  end

end

# load all ruby files in the directory "lib" and its subdirectories
require_rel '../lib'
