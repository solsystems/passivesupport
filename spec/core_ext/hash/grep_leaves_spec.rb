require 'spec_helper'
require 'passive_support/core_ext/hash/grep_leaves'

describe Hash do
  describe "#grep_leaves" do
    it "doesn't return matches in keys" do
      subject = { matches: :random }

      subject.grep_leaves(/match/).keys.should_not eq([:matches])
    end

    it "finds matches in values" do
      subject = {
        oogle: [:foogle, :boogle],
        zork: [:gork, :bork],
        foo: :bar
      }

      subject.grep_leaves(/g/).should eq({ oogle: [:foogle, :boogle], zork: [:gork] })
    end
  end
end
