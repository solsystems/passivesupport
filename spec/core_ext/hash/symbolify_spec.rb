require 'spec_helper'
require 'passive_support/core_ext/hash/symbolify'

describe Hash do
  describe "#symbolify" do
    it "converts keys one level deep by default" do
      subject = { "I" => "am" }

      subject.symbolify.should eq({ I: "am" })
    end

    it "accepts a 'depth' argument and converts 'depth' levels deep" do
      subject = { "the" => { "very" => { "model" => "of" } } }
      subject.symbolify(2).should eq({ the: { very: { "model" => "of" } } })
    end

    it "won't explode when a key cannot be symbolized" do
      subject = { 1 => :modern_major_general }

      expect{ subject.symbolify }.to_not raise_error
    end
  end
end
