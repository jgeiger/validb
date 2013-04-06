require 'spec_helper'

describe Validb::Checker do
  describe "#perform" do
    it "generates validb model validator jobs" do
      checker = Validb::Checker.new
      jid = Validb::Batcher.perform_async(["Blog", "Post"], 100)

      expect {
        checker.perform(jid)
      }.to change(Validb::ModelValidator.jobs, :size).by(2)
    end
  end
end
