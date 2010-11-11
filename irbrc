require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# Enable reverse search history
require 'readline'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:EVAL_HISTORY] = 200
