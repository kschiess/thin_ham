require File.dirname(__FILE__) + '/../spec_helper'

require 'thin_ham/hamlr'

require 'rack/mock'
require 'rack/lint'

describe ThinHam::Hamlr do
  it "should be initialized with a path" do
    ThinHam::Hamlr.new('.')
  end
  
  context 'fixtures (unit)' do
    attr_reader :hamlr
    before(:each) do
      @hamlr = ThinHam::Hamlr.new(
        FIXTURES_ROOT)
    end

    describe "#call" do
      before(:each) do
        # Don't duplicate instance - this makes mocking/stubbing possible
        flexmock(hamlr).should_receive(:dup).and_return(hamlr)
      end
    end
    describe "#http_answer" do
      attr_reader :mtime_http, :result
      before(:each) do
        @result = hamlr.http_answer(
          File.read(FIXTURES_ROOT + "/html_file.html"), 
          'text/html')
      end
      it "should return http code 200 OK" do
        result.first.should == 200
      end
      it "should have an header hash at second position" do
        result.at(1).should be_an_instance_of(Hash)
      end
      it "should have a body at last position" do
        result.last.size.should > 10
      end

      describe "header hash" do
        attr_reader :headers
        before(:each) do
          @headers = result.at(1)
        end
        it { headers.should have_key('Content-Length') }
        it { headers.should have_key('Content-Type') }
      end
    end
  end
  context 'fixtures (functional)' do
    attr_reader :request
    before(:each) do
      @request = Rack::MockRequest.new(
        Rack::Lint.new(
          ThinHam::Hamlr.new(
            FIXTURES_ROOT)))
    end
    it "should return a 404 if the file cannot be found" do
      request.get('/this_file_doesnt_exist').should be_not_found
    end
    it "should return 200 OK for an html file" do
      request.get('/html_file.html').should be_ok
    end
    it "should return the file content of html_file.html" do
      request.get('/html_file.html').should match(/a simple html file/)
    end
    
    context 'haml rendering' do
      it "should return 200 OK for test1.html" do
        request.get('/test1.html').should be_ok
      end
      it "should contain html header for test1.html" do
        request.get('/test1.html').should match(%r{<body>\s+This is a test\s+</body>})
      end
    end
    context 'sass rendering' do
      it "should return 200 OK for test1.css" do
        request.get('/test1.css').should be_ok
      end
    end
  end
end
