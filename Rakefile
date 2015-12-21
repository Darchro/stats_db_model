require "bundler/setup"
require "bundler/gem_tasks"

APP_ROOT = File.dirname(__FILE__)
APP_ENV = (ENV['APP_ENV'] || 'development').to_sym

if defined?(Bundler)
  Bundler.require(:default)
  Bundler.require(:development) if APP_ENV == :development
end

require "active_support/all"
require "yaml"

DB_CONFIGURATIONS = YAML.load_file(File.join(APP_ROOT, 'db', 'config.yml')).deep_symbolize_keys
ActiveRecordMigrations.configure do |c|
end
ActiveRecordMigrations.load_tasks
# Clear danger tasks
# ["db:drop", "db:fixtures:load", "db:schema:load"].each do |task|
#   Rake::Task[task].clear
# end

desc "Open console"
task :console do
  ActiveRecord::Base.establish_connection DB_CONFIGURATIONS[APP_ENV]
  StatsDbModel::Configuration::DB.setup DB_CONFIGURATIONS[APP_ENV]
  StatsDbModel::Configuration::Logger.setup Logger.new STDOUT

  include StatsDbModel
  pry
end
task default: :console