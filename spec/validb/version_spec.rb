require 'spec_helper'

describe Validb do
  it "returns the version" do
    Validb::VERSION.should == "1.2.0"
  end
end
