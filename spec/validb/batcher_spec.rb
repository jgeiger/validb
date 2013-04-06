require 'spec_helper'

describe Validb::Batcher do
  describe "#perform" do
    it "sends an invalid record logging event" do
      record = Blog.new
      record.save(validate: false)
      batcher = Validb::Batcher.new
      jid = Validb::Batcher.perform_async("Blog", [record.id])

      expect {
        batcher.perform(jid)
      }.to change(Validb::FileSystemLoggerWorker.jobs, :size).by(1)
    end
  end
end
