require 'spec_helper'
require 'passive_support/core_ext/hash/leaves'

describe Hash do
  describe "#leaves" do
    it "returns an array containing a single value for a simple Hash" do
      subject = { this: :that }

      subject.leaves.should eq([:that])
    end

    it "returns all of the values when there are more than one" do
      subject = { this: [:that, :the_other] }

      subject.leaves.should eq([:that, :the_other])
    end

    it "finds the endpoint of a chain" do
      subject = { I: { am: { a: :leaf } } }
      subject.leaves.should eq([:leaf])
    end

    it "handles multiple keys" do
      subject = {
        beverages: { caffinated: [:coffee, :tea] },
        vehicles: [:car, :truck, :airplane],
        dessert: :ice_cream,
      }

      subject.leaves.should == [:coffee, :tea, :car, :truck, :airplane, :ice_cream]
    end
  end
end
