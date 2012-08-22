require "json"
require "securerandom"
require "press"
require "queue_classic"
require "worked/error"
require "worked/conf"
require "worked/work"

module Worked
  module Tasks
    module Worker
      extend Press

      def self.run
        ctx app: Conf.app_name, task: "api"
        QC::Worker.new(QC::QUEUE, QC::TOP_BOUND, QC::FORK_WORKER, QC::LISTENING_WORKER, QC::MAX_LOCK_ATTEMPTS).start
      end
    end
  end
end
