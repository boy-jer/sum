GEM_NAME = 'sum'
GEM_FILES = FileList['**/*'] - FileList['coverage', 'coverage/**/*', 'pkg', 'pkg/**/*']
GEM_SPEC = Gem::Specification.new do |s|
  # == CONFIGURE ==
  s.author = "Winton Welsh"
  s.email = "mail@wintoni.us"
  s.homepage = "http://github.com/winton/#{GEM_NAME}"
  s.summary = "Sinatra app that powers SumApp.com, a super simple budgeting system"
  # == CONFIGURE ==
  s.add_dependency('bmabey-email_spec', '=0.2.0')
  s.add_dependency('cucumber', '>=0.3.11')
  s.add_dependency('haml', '=2.0.9')
  s.add_dependency('less', '>=0.8.11')
  s.add_dependency('javan-whenever', '=0.3.6')
  s.add_dependency('rspec', '>=1.2.7')
  s.add_dependency('shotgun', '>=0.3')
  s.add_dependency('sinatra', '=0.9.2')
  s.add_dependency('winton-active_wrapper', '=0.1.5')
  s.add_dependency('winton-externals', '=1.0.2')
  s.add_dependency('winton-fetcher', '=0.1.2')
  s.add_dependency('winton-secret_key', '=0.1.0')
  s.executables << GEM_NAME
  s.extra_rdoc_files = [ "README.markdown" ]
  s.files = GEM_FILES.to_a
  s.has_rdoc = false
  s.name = GEM_NAME
  s.platform = Gem::Platform::RUBY
  s.require_path = "lib"
  s.version = "0.1.0"
end
