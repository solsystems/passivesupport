require 'spec_helper'
require 'passive_support/core_ext/object/try_send'

describe Object do
  subject do
    Object.new
  end

  describe "#try_send" do
    it "returns #self if the method is missing" do
      subject.try_send(:non_existent_method).should be(subject)
    end

    it "sends the method if the object responds to it" do
      subject.try_send(:class).should eq(Object)
    end

    it "passes additional arguments to #send" do
      expect { subject.try_send(:respond_to?, :class) }.to_not raise_exception
      subject.try_send(:respond_to?, :class).should be_true
    end
  end
end
