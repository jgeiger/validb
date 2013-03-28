require 'spec_helper'

describe Validb::Configuration do
  describe "#initialize" do
    it "creates a configuration" do
      Validb::Configuration.any_instance.should_receive(:print_ignored)
      Validb::Configuration.new("")
    end
  end

  describe "#params" do
    context "with a missing configuration file" do
      it "creates a params" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/missing.json')
        params = Validb::Configuration.new(filename).params
        params.ignored_models.should == []
        params.ignored_prefixes.should == []
        params.batch_size.should == 100
      end
    end

    context "with a configuration file" do
      it "returns the batch size" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
        params = Validb::Configuration.new(filename).params
        params.ignored_models.should == [Blog, Post]
        params.ignored_prefixes.should == ["Api"]
        params.batch_size.should == 200
      end
    end
  end
end
