require 'spec_helper'

describe Validb::Batcher do
  describe "#perform" do
    it "sends an invalid record logging event" do
      record = Blog.new
      record.save(validate: false)
      uuid = Validb::Batcher.create(
        "model_name" => "Blog",
        "model_ids" => [record.id]
      )

      Resque::Plugins::Status::Hash.status_ids.should include(uuid)
    end
  end
end
