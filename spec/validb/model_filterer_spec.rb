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
      configuration = Validb::Configuration.new(filename)
      model_filterer = Validb::ModelFilterer.new(configuration)

      models = [User, Author, Blog, Post, Api::Approval, Comment, Person]

      model_filterer.filter(models).should =~ [Comment, Person]
    end
  end
end
