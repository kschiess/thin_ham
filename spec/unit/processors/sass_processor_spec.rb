require File.dirname(__FILE__) + '/../../spec_helper'

describe ThinHam::Processors::Sass do
  attr_reader :processor
  before(:each) do
    @processor = ThinHam::Processors::Sass.new
  end
  
  it "should inherit functionality from Markup" do
    processor.should be_a_kind_of(ThinHam::Processors::Markup)
  end
  
  describe "#map_to_file" do
    it { processor.map_to_file('foo').should == 'foo.sass' }
  end
  
  describe "#process" do
    it "should transform Sass into CSS" do
      processor.process(%Q{
body
  :width 100px
      }).should == "body {\n  width: 100px; }\n"
    end
  end
end