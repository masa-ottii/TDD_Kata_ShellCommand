require_relative "list_mod"
require_relative "valid_mod"

class Cd
  include ListModule
  include ValidateModule

  def initialize
    @count = 0
    @dir_names = []
  end
  def exec(current_dir)
    array = file_list("#{current_dir}/*")
    array.each {|a_path| puts a_path }
    input = ""
    until only_number?(input) && in_range?(0,@count,input)do
      print "番号でディレクトリを選択してください(階層を一つ戻るには0と入力)："
      input = $stdin.gets.chomp
    end
    if (input.to_i) == 0
      Dir.chdir("..")
    else
      open_dir_name = @dir_names[(input.to_i)-1]
      Dir.chdir("./#{open_dir_name}")
    end
    return Dir.getwd
  end
  def make_print_name(stat,short_name)
    if stat.directory?
      @count += 1
      @dir_names << short_name
      sprintf("%2d\t%s\t%s",@count,stat.mtime,short_name)
    else
      sprintf(" #\t%s\t%s",stat.mtime,short_name)
    end
  end
end
