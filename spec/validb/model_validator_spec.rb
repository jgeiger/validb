require 'spec_helper'

describe Validb::ModelValidator do
  describe "#perform" do
    context "with available records" do
      it "creates a batcher job" do
        Resque.stub(:inline?).and_return(true)
        Blog.delete_all

        record = Blog.new(title: "title")
        record.save
        Validb::Batcher.should_receive(:create).with(
          "model_name" => "Blog",
          "model_ids" => [record.id]
        )

        uuid = Validb::ModelValidator.create(
          "model_name" => "Blog",
          "batch_size" => 100
        )
      end
    end

    context "with no available records" do
      it "does not create a batcher job" do
        Resque.stub(:inline?).and_return(true)
        Blog.delete_all
        Validb::Batcher.should_not_receive(:create)

        uuid = Validb::ModelValidator.create(
          "model_name" => "Blog",
          "batch_size" => 100
        )
      end
    end
  end
end
