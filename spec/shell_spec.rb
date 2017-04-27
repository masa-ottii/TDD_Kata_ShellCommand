require_relative "../shell"

RSpec.describe Shell do
  let(:shell){ Shell.new }
  it "初期状態のカレントディレクトリは起動時のカレントディレクトリ" do
    expect(shell.current_dir).to eq(Dir.getwd)
  end
  it "カレントディレクトリの短い名前は一番深い名前" do
    shell.current_dir = "/src/ruby/exc_ruby3"
    expect(shell.short_current_dir).to eq("exc_ruby3")
  end
  it "そもそも短い名前の場合はそのままの名前で扱う" do
    shell.current_dir = "/src/ruby/exc_ruby3"
    expect(shell.short_current_dir).to eq("exc_ruby3")
  end
  it "コマンドプロンプトの表示はカレントディレクトリの短い名前と:>の組み合わせ" do
    shell.current_dir = "/src/ruby/exc_ruby3"
  end
  it "標準出力のテストのテスト" do
    expect { ["A","B","C",].each {|e| puts e} }.to output("A\nB\nC\n").to_stdout
  end
  it { expect(10 + 5).to eq(15) }

end
