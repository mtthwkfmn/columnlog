require 'rubygems'

%w{app}.each do |file|
  require File.join(File.dirname(__FILE__), 'columnlog', file)
end