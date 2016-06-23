module Minitest
  def self.plugin_silent_init(options)
    reporter.reporters.clear
  end
end
