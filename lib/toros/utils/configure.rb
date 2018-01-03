##
# Default configuration of Midori, extends +Configurable+
class Toros::Configure
  extend Toros::Configurable

  set :logger, ::Logger.new(STDOUT)
  set :protocol, :http
  set :default_service, nil
end
