require 'spec_helper'

describe Validb do
  it "returns the version" do
    Validb::VERSION.should == "1.1.3"
  end
end
