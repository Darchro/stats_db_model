module StatsDbModel
  module Configuration
    class DB
      def self.setup(options={})
        StatsDbModel::Base.establish_connection options
      end
    end
  end
end