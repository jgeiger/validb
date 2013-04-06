require 'spec_helper'

describe Validb::Counter do
  describe "#count" do
    it "prints the model names, tables and record counts" do
      counter = Validb::Counter.new(["Blog"])
      $stdout.should_receive(:puts).with("\nChecking models:")
      $stdout.should_receive(:puts).with("Blog(blogs) (1 records)")

      counter.count
    end
  end
end
