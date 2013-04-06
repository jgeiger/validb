require 'spec_helper'

describe Validb::Finder do
  class NoTableModel < ActiveRecord::Base
  end

  describe "#initialize" do
    it "creates a model filterer" do
      params = double('params')
      Validb::ModelFilterer.should_receive(:new).with(params)
      Validb::Finder.new(params, "")
    end
  end

  describe "#models" do
    context "with an empty string" do
      it "returns all the models with tables" do
        params = Validb::Configuration.new("").params
        finder = Validb::Finder.new(params, "")
        finder.models.should == ["Author", "Blog", "Comment", "Post"]
      end
    end

    context "valid model names" do
      it "returns all the selected models with tables" do
        params = Validb::Configuration.new("").params
        finder = Validb::Finder.new(params, "Post, Blog")
        finder.models.should == ["Blog", "Post"]
      end
    end

    context "with invalid model names" do
      it "returns all the valid models with tables" do
        params = Validb::Configuration.new("").params
        finder = Validb::Finder.new(params, "Post, Blog, Fake")
        finder.models.should == ["Blog", "Post"]
      end
    end
  end
end
