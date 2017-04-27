require_relative "valid_mod"

class Mkdir
  include ValidateModule
  def exec(path)
    input = ""
    while empty_string?(input) do
      print "作成するディレクトリの名前を入力してください："
      input = $stdin.gets.chomp
    end
    begin
      Dir.mkdir(input)
    rescue Errno::EEXIST => ex
      puts "すでに存在するディレクトリです。"
    rescue Errno::EXXX => ex
      puts "エラーが発生しディレクトリを作成できませんでした。"
    end
  end
end
