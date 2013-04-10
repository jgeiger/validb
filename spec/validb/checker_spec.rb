require 'spec_helper'

describe Validb::Checker do
  describe "#perform" do
    it "generates validb model validator jobs" do
      uuid = Validb::Checker.create(
        "model_names" => ["Blog", "Post"],
        "batch_size" => 100
      )

      Resque::Plugins::Status::Hash.status_ids.should include(uuid)
    end
  end
end
