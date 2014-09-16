ENV['CODECLIMATE_REPO_TOKEN'] = 'd535a0f3a26992d0f6e1d639f76a3b4972814f146a9803632c7c950f2f851da2' 
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.before(:suite) { Timecop.freeze(Date.new(2014, 9, 1)) }
end
