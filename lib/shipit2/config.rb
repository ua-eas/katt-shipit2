
class ShipIt2::Config < ShipIt2::Base

  def initialize(args={})
    config_file = args[:config_file] || default_config_file
    @config = _load_config(config_file)

    post_initialize(args)
  end

  protected

  def default_config_file
    raise ShipIt2::NotImplementedError.new "default_config_file must be implemented by a child of the ShipIt2::Config class"
  end

  def post_initialize(args)
    nil
  end

  private

  def _load_config(config_file)
    if File.exists? config_file
      config_text = YAML.load File.read(config_file)
    else
      raise "Config file " + config_file + " is missing."
    end
  end
end
