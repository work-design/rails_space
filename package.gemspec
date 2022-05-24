Gem::Specification.new do |s|
  s.name = 'rails_space'
  s.version = '0.0.1'
  s.authors = ['qinmingyuan']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_space'
  s.summary = 'Summary of RailsSpace.'
  s.description = 'Description of RailsSpace.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails', '>= 7.0.3'
end
