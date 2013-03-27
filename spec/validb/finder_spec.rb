require 'spec_helper'

describe Validb::Finder do
  class NoTableModel < ActiveRecord::Base
  end

  describe "#initialize" do
    it "creates a model filterer" do
      configuration = double('configuration')
      Validb::ModelFilterer.should_receive(:new).with(configuration)
      Validb::Finder.new(configuration, "")
    end
  end

  describe "#models" do
    context "with an empty string" do
      it "returns all the models with tables" do
        configuration = Validb::Configuration.new("")
        finder = Validb::Finder.new(configuration, "")
        finder.models.should =~ [Post, Blog, Comment, Person]
      end
    end

    context "valid model names" do
      it "returns all the selected models with tables" do
        configuration = Validb::Configuration.new("")
        finder = Validb::Finder.new(configuration, "Post, Blog")
        finder.models.should =~ [Post, Blog]
      end
    end

    context "with invalid model names" do
      it "returns all the valid models with tables" do
        configuration = Validb::Configuration.new("")
        finder = Validb::Finder.new(configuration, "Post, Blog, Fake")
        finder.models.should =~ [Post, Blog]
      end
    end
  end
end
