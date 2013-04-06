require 'spec_helper'

describe Validb::ModelValidator do
  describe "#perform" do
    context "with available records" do
      it "creates a batcher job" do
        record = Blog.new(title: "title")
        record.save
        model_validator = Validb::ModelValidator.new
        jid = Validb::ModelValidator.perform_async("Blog", 100)

        expect {
          model_validator.perform(jid)
        }.to change(Validb::Batcher.jobs, :size).by(1)
      end
    end

    context "with no available records" do
      it "does not create a batcher job" do
        Blog.delete_all
        model_validator = Validb::ModelValidator.new
        jid = Validb::ModelValidator.perform_async("Blog", 100)

        expect {
          model_validator.perform(jid)
        }.not_to change(Validb::Batcher.jobs, :size)
      end
    end
  end
end
