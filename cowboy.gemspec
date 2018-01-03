require './lib/cowboy/version'

Gem::Specification.new do |s|
  s.name                     = 'cowboy'
  s.version                  = Cowboy::VERSION
  s.required_ruby_version    = '>=2.2.6'
  s.date                     = Time.now.strftime('%Y-%m-%d')
  s.summary                  = 'Third Party Qiniu SDK'
  s.description              = 'Yet Another Third Party Qiniu SDK'
  s.authors                  = ['HeckPsi Lab']
  s.email                    = ['business@heckpsi.com']
  s.require_paths            = ['lib']
  s.files                    = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|.resources)/}) } \
    - %w(README.md CODE_OF_CONDUCT.md CONTRIBUTING.md Gemfile Rakefile midori.gemspec .gitignore .rspec .codeclimate.yml .rubocop.yml .travis.yml logo.png Rakefile Gemfile)
  s.homepage                 = 'https://github.com/dsh0416/cowboy'
  s.metadata                 = { 'issue_tracker' => 'https://github.com/dsh0416/cowboy/issues' }
  s.license                  = 'MIT'
end
