guard :rspec, cmd: "rspec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^(.+)\.rb$}){ |tested_file| "spec/#{tested_file[1]}_spec.rb" }
  watch('spec/spec_helper.rb'){ 'spec' }
end
