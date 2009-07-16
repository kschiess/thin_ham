(in /Users/kaspar/git/own/thin_ham)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{thin_ham}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kaspar Schiess"]
  s.date = %q{2009-07-16}
  s.default_executable = %q{thin_ham}
  s.description = %q{thin_ham is a small tool to allow for fast prototyping of web sites. It will
publish files written in haml & sass [1] or alternatively just publish
whatever other files you happen to have lying around in the relevant
directories.

Since it is written as a web server, it will allow running javascript in your
prototype to use AJAX to load missing resources. This can be very useful when
developing modern websites. 

Note that thin_ham should under NO circumstances be used as a public web
server. It is not made that way.}
  s.email = ["kaspar.schiess@absurd.li"]
  s.executables = ["thin_ham"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/thin_ham", "lib/thin_ham/hamlr.rb", "lib/thin_ham/init.rb", "lib/thin_ham/processors/haml.rb", "lib/thin_ham/processors/markup.rb", "lib/thin_ham/processors/sass.rb", "spec/fixtures/foo.html.haml", "spec/fixtures/html_file.html", "spec/fixtures/pieces/bar.haml", "spec/fixtures/test1.css.sass", "spec/fixtures/test1.html.haml", "spec/spec.opts", "spec/spec_helper.rb", "spec/unit/hamlr_spec.rb", "spec/unit/processors/haml_processor_spec.rb", "spec/unit/processors/markup_processor_spec.rb", "spec/unit/processors/sass_processor_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{Source: }
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{thin_ham}
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{thin_ham is a small tool to allow for fast prototyping of web sites}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.3.2"])
    else
      s.add_dependency(%q<hoe>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.3.2"])
  end
end
