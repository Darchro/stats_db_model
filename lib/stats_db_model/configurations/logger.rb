module StatsDbModel
  module Configuration
    class Logger
      def self.setup(logger)
        StatsDbModel::Base.logger = logger
      end
    end
  end
end