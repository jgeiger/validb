require 'spec_helper'

describe Validb::Tasker do
  describe "#run" do
    it "runs the database validation" do
      filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
      tasker = Validb::Tasker.new("", filename)

      tasker.should_receive(:load_models_and_prepare_logger)
      Validb::Counter.any_instance.should_receive(:count)
      Validb::QueueMonitor.any_instance.should_receive(:monitor)

      expect {
        tasker.run
      }.to change(Validb::Checker.jobs, :size).by(1)
    end
  end
end
