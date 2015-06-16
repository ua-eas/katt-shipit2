class ShipIt2::Jira < ShipIt2::Base

  def initialize(args={})

    jira_config = get_jira_client_config

    options = {
      :username => jira_config.jira_user,
      :password => jira_config.jira_password,
      :site     => jira_config.jira_url,
      :context_path => "",
      :auth_type => :basic,
      :use_ssl => true,
      :ssl_verify_mode => 0
    }

    @client = args[:jira_client] || JIRA::Client.new(options)

  end

  def add_version_for_project( new_version, project_name )
    # release older versions
    project = @client.Project.find project_name
    unreleased = project.versions.select do |v|
      v.attrs['released'] == false
    end
    unreleased.each do |version|
      version.save({ "released" => true })
    end
    # create the new version
    version = @client.Version.build
    save_was_successful = version.save({ "name" => new_version, "project" => project_name })
    unless save_was_successful
      raise "The new version failed to save."
    end
  end
end
