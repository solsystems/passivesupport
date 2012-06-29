require 'spec_helper'
require 'passive_support/core_ext/hash/compress_chains'

describe Hash do
  describe "#compress_chains" do
    it "leaves already compressed Hashes alone" do
      subject = { han: :leia }
      subject.compress_chains.should eq(subject)
    end

    it "compresses a simple chain" do
      subject = { anakin: { princess: :amidala } }
      subject.compress_chains.should eq({ anakin: :amidala })
    end

    it "should not compress Hashes that aren't chains" do
      subject = {
        love_interests: {
          ariel: :eric,
          cinderella: :prince_charming,
          jasmine: :aladdin,
        }
      }

      subject.compress_chains.should eq(subject)
    end

    it "should compress only chains in a more complicated Hash" do
      subject = {
        christine: [:eric, :raoul],
        phantom: { eric: :masked_man },
      }

      expected = {
        christine: [:eric, :raoul],
        phantom: :masked_man
      }
      subject.compress_chains.should eq(expected)
    end
  end
end
