require 'mongo_mapper'
require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'key_attributes'

#log_dir = File.expand_path('../../log', __FILE__)
#FileUtils.mkdir_p(log_dir) unless File.exist?(log_dir)
#logger = Logger.new(log_dir + '/test.log')
#
#LogBuddy.init(:logger => logger)
#MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017, :logger => logger)
#MongoMapper.database = "test"
#MongoMapper.database.collections.each { |c| c.drop_indexes }
