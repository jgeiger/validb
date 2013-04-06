require 'spec_helper'

describe Validb::QueueMonitor do

  describe "#monitor" do
    it "prints progress information" do
      $stdout.should_receive(:print).with("\nValidating database records")
      $stdout.should_receive(:puts)

      queue_monitor = Validb::QueueMonitor.new
      queue_monitor.monitor
    end
  end
end
