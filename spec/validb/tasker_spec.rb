require 'spec_helper'

describe Validb::Tasker do
  describe "#run" do
    it "runs the database validation" do
      Resque.stub(:inline?).and_return(true)
      filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
      tasker = Validb::Tasker.new("", filename)

      tasker.should_receive(:load_models_and_prepare_logger)
      Validb::Counter.any_instance.should_receive(:count)
      Validb::QueueMonitor.any_instance.should_receive(:monitor)
      Validb::Checker.should_receive(:create)

      tasker.run
    end
  end
end
