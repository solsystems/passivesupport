require 'spec_helper'
require 'passive_support/core_ext/string/numberize'

describe Hash do
  describe "#numberize" do
    it "includes the number in the returned string" do
      'action'.numberize(1).should eq("1 action")
    end
    
    it "pluralizes a singular string if count != 1" do
      "activity".numberize(5).should eq("5 activities")
    end

    it "doesn't change a plural string if count != 1" do
      "appliances".numberize(4).should eq("4 appliances")
    end

    it "pluralizes when count is 0" do
      "zero".numberize(0).should eq("0 zeros")
    end

    it "singularizes a plural string if count == 1" do
      "beetles".numberize(1).should eq("1 beetle")
    end

    it "doesn't change a singular string if count == 1" do
      "faucet".numberize(1).should eq("1 faucet")
    end
  end
end
