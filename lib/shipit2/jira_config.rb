class ShipIt2::JiraConfig < ShipIt2::Config

  attr_reader :jira_user, :jira_password, :jira_url

  def post_initialize(args={})

    @jira_user     = @config['jira']['user']
    @jira_password = @config['jira']['password']
    @jira_url      = @config['jira']['url']

  end

  protected

  def default_config_file
    return File.dirname(__FILE__) + "/../../config/jira_client.yaml"
  end

end
