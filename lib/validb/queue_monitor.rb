module Validb
  class QueueMonitor

    def monitor
      saved_time = Time.now
      $stdout.print "\nValidating database records"

      wait_for_completion

      $stdout.puts "\nComplete in #{Time.now - saved_time} seconds"
    end

    private

    def wait_for_completion
      while in_process_jobs?
        sleep 1
        $stdout.print "."
      end
    end

    def in_process_jobs?
      statuses.detect { |job| job.status != "completed" }
    end

    def statuses
      Resque::Plugins::Status::Hash.statuses
    end
  end
end
