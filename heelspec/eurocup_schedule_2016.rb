require "heel/bot"
require "heel/shell"

module Heelspec
  class EuroCupSchedule2016 < Heel::Bot::Bot
    def initialize
      @bot_name = "Euro Cup Schedule 2016"
      @bot_version = "1.0.0"
    end

    def run
      Heel::Shell.open "https://gist.github.com/crispgm/1eedbc85b23470a5b9ca81ac3072f8f1"
    end
  end
end