require_relative "list_mod"
require_relative "valid_mod"

class Open
  include ListModule
  include ValidateModule

  def initialize
    @count = 0
    @file_names = []
  end
  def exec(current_dir)
    array = file_list("#{current_dir}/*")
    array.each {|a_path| puts a_path }
    input = ""
    until only_number?(input) && in_range?(1,@count,input)do
      print "番号でファイルを選択してください："
      input = $stdin.gets.chomp
    end
    open_file_name = @file_names[(input.to_i)-1]
    puts "----#{open_file_name}の内容----"
    File.open(open_file_name) do |f|
      f.each do |line|
        puts line
      end
    end
  end
  def make_print_name(stat,short_name)
    unless stat.directory?
      @count += 1
      @file_names << short_name
      sprintf("%2d\t%s\t%s",@count,stat.mtime,short_name)
    else
      sprintf(" #\t%s\t%s",stat.mtime,short_name)
    end
  end
end
