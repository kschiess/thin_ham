require File.dirname(__FILE__) + '/../../spec_helper'

describe ThinHam::Processors::Haml do
  attr_reader :processor
  before(:each) do
    @processor = ThinHam::Processors::Haml.new
  end
    
  it { processor.should be_a_kind_of(ThinHam::Processors::Markup) }
  
  it "should map 'foo' to file 'foo.haml'" do
    processor.map_to_file('foo').should == 'foo.haml'
  end

  describe "#serve" do
    attr_reader :controller
    before(:each) do
      @controller = flexmock(:controller)
      controller.should_ignore_missing
    end
    
    it "should process the haml file" do
      flexmock(processor).should_receive(:process).once
      
      processor.serve(fixture('test1.html'))
    end
    it "should allow including pieces (other haml files)" do
      processor.serve(fixture('foo.html')).should match(/bar/)
    end
  end
  
  describe '#process' do
    it "should turn haml into html" do
      processor.process(%Q{
!!!
!!! XML
%body
  Test
      }, anything).should match(/<body>\s+Test\s+<\/body>/im)
    end
  end
end