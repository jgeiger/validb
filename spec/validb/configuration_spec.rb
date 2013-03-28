require 'spec_helper'

describe Validb::Configuration do
  describe "#initialize" do
    it "creates a configuration" do
      Validb::Configuration.any_instance.should_receive(:print_ignored)
      Validb::Configuration.new("")
    end
  end

  describe "#batch_size" do
    context "with a missing configuration file" do
      it "returns 100" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/missing.json')
        configuration = Validb::Configuration.new(filename)
        configuration.batch_size.should == 100
      end
    end

    context "with a configuration file" do
      it "returns the batch size" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
        configuration = Validb::Configuration.new(filename)
        configuration.batch_size.should == 200
      end
    end
  end


  describe "#ignored_models" do
    context "with a missing configuration file" do
      it "returns an empty array" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/missing.json')
        configuration = Validb::Configuration.new(filename)
        configuration.ignored_models.should == []
      end
    end

    context "with a configuration file" do
      it "returns the ignored models" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
        configuration = Validb::Configuration.new(filename)
        configuration.ignored_models.should == [Blog, Post]
      end
    end
  end

  describe "#ignored_prefixes" do
    context "with a missing configuration file" do
      it "returns an empty array" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/missing.json')
        configuration = Validb::Configuration.new(filename)
        configuration.ignored_prefixes.should == []
      end
    end

    context "with a configuration file" do
      it "returns the ignored models" do
        filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
        configuration = Validb::Configuration.new(filename)
        configuration.ignored_prefixes.should == ["Api"]
      end
    end
  end
end
