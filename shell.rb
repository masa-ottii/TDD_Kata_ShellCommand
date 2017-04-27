require_relative "cd"
require_relative "ls"
require_relative "open"
require_relative "mkdir"
require_relative "touch"

class Shell
  attr_accessor :current_dir
  def initialize
    @current_dir = Dir.getwd
  end
  def start
    while true
      print prompt
      input = $stdin.gets.chomp
      case input
      when "quit"
        break
      when "cd"
        @current_dir = Cd.new.exec(@current_dir)
      when "ls"
        Ls.new.exec(@current_dir)
      when "open"
        Open.new.exec(@current_dir)
      when "mkdir"
        Mkdir.new.exec(@current_dir)
      when "touch"
        Touch.new.exec(@current_dir)
      end
    end
  end
  def prompt
    "#{short_current_dir}:>"
  end
  def short_current_dir
    (@current_dir.split('/'))[-1]
  end
end
if $0 == __FILE__
  Shell.new.start
end
