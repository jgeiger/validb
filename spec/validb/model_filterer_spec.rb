require 'spec_helper'

describe Validb::ModelFilterer do

  class Author < Person
  end

  module Api
    class Approval < ActiveRecord::Base
      self.table_name = "approvals"
    end
  end

  describe "#models" do
    it "returns all the non filtered models" do
      filename = File.expand_path(File.dirname(__FILE__) + '/../config/validb.json')
      params = Validb::Configuration.new(filename).params
      model_filterer = Validb::ModelFilterer.new(params)

      models = [User, Author, Blog, Post, Api::Approval, Comment, Person]

      model_filterer.filter(models).should == [Author, Comment]
    end
  end
end
