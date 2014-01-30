
class ShipIt2::Project < ShipIt2::Base

  attr_reader :jira_tag

  def initialize(args={})
    @jira = args[:jira]
  end

  def jira_tag
    raise ShipIt2::NotImplementedError.new "jira_tag must be implemented by a child of the ShipIt2::Project class"
  end

  def add_version(version)
    @jira.add_version_for_project version , jira_tag
  end

end
