require File.dirname(__FILE__) + '/../../spec_helper'

require 'thin_ham/processors/markup'

describe ThinHam::Processors::Markup do
    attr_reader :processor
    before(:each) do
      @processor = ThinHam::Processors::Markup.new
    end

    describe "#serve" do
      attr_reader :controller
      before(:each) do
        @controller = flexmock(:controller)
        controller.should_ignore_missing
      end

      it "should return result from #process" do
        flexmock(processor).
          should_receive(:read_markup).
          should_receive(:process).and_return(:result_from_process)
        
        processor.serve(:filename).should == :result_from_process
      end
      it "should process the markup file" do
        flexmock(processor).
          should_receive(:map_to_file).and_return(fixture('test1.html.haml')).
          should_receive(:process).with(String).once

        processor.serve(:filename)
      end
    end
end