require_relative "valid_mod"

class Touch
  include ValidateModule
  def exec(path)
    input = ""
    while empty_string?(input) do
      print "作成するファイルの名前を入力してください："
      input = $stdin.gets.chomp
    end
    if File.exists?(input)
      puts "すでに存在するファイルです。"
      return
    else
      File.open(input,"w"){}
    end
  end
end
