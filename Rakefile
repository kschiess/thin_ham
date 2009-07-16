require 'rubygems'
require 'hoe'

namespace :hoe do # Too much out of the box... 
  Hoe.spec 'thin_ham' do 
    developer('Kaspar Schiess', 'kaspar.schiess@absurd.li')

    # self.rubyforge_name = 'thin_hamx' # if different than 'thin_ham'
  end
end

require 'rake'
require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = %w{--options spec/spec.opts}
end

task :default => :spec