require 'drb'
require 'adhearsion/voip/asterisk/manager_interface'
require 'singleton'

class AdhearsionAPI
  include Adhearsion::VoIP::Asterisk::Manager
  include Singleton
  attr_accessor :drb

  def initialize(args = {})
    @drb = DRbObject.new_with_uri 'druby://localhost:9050'
  end

  def method_missing(method_name, *args)
    @drb.send method_name, *args
  end
end
