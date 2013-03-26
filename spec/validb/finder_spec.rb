require 'spec_helper'

describe Validb::Finder do
  class NoTable < ActiveRecord::Base
  end

  describe "#models" do
    context "with an empty string" do
      it "returns all the models with tables" do
        finder = Validb::Finder.new("")
        finder.models.should =~ [Post, Blog, Comment]
      end
    end

    context "valid model names" do
      it "returns all the selected models with tables" do
        finder = Validb::Finder.new("Post, Blog")
        finder.models.should =~ [Post, Blog]
      end
    end

    context "with invalid model names" do
      it "returns all the valid models with tables" do
        finder = Validb::Finder.new("Post, Blog, Fake")
        finder.models.should =~ [Post, Blog]
      end
    end
  end
end
