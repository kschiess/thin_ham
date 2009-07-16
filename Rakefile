require 'rubygems'
require 'hoe'

namespace :hoe do # Too much out of the box... 
  Hoe.spec 'thin_ham' do 
    developer('Kaspar Schiess', 'kaspar.schiess@absurd.li')

    # self.rubyforge_name = 'thin_hamx' # if different than 'thin_ham'
    
    self.extra_deps << [ 'thin', '>=1.0' ]
    self.extra_deps << [ 'rack', '>=1.0' ]
  end
end

require 'rake'
require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = %w{--options spec/spec.opts}
end

desc "Recreate thin_ham.gemspec through hoe"
task :gemspec do
  sh "rake hoe:debug_gem > thin_ham.gemspec"
end

task :default => :spec