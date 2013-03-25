require 'spec_helper'

describe Validb::Finder do
  class NoTable < ActiveRecord::Base
  end

  describe ".get_models" do
    context "with an empty string" do
      Validb::Finder.get_models("").should =~ [Post, Blog, Comment]
    end

    context "valid model names" do
      Validb::Finder.get_models("Post, Blog").should =~ [Post, Blog]
    end

    context "with invalid model names" do
      Validb::Finder.get_models("Post, Blog, Fake").should =~ [Post, Blog]
    end
  end
end
