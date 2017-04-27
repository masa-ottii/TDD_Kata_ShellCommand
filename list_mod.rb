module ListModule
  def file_list(current_path)
    array = []
    Dir.glob(current_path) do |path_name|
      stat = File::Stat.new(path_name)
      array << make_print_name(stat,short_name(path_name))
    end
    return array
  end
  def short_name(path_name)
    path_name.split("/")[-1]
  end
end
