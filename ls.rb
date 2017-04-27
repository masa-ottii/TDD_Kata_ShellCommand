require_relative "list_mod"
class Ls
  include ListModule
  def exec(current_dir)
    array = file_list("#{current_dir}/*")
    array.each {|a_path| puts a_path }
  end
  def make_print_name(stat,short_name)
    sprintf("  \t%s\t%s",stat.mtime,short_name)
  end
end
