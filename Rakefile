# frozen_string_literal: true

STREE_FILES = '"**/*.{rb,rake,gemspec}" "**/Rakefile" "**/Gemfile"'
EXAMPLES = %w[minimal complex].freeze

desc 'Run all tests'
task :test do
  test_files =
    Dir.glob('test/**/*_test.rb').sort.map { |f| File.expand_path(f) }
  sh "RUBY_BOX=1 ruby -Ilib -Itest -e 'ARGV.each { |f| require f }' #{test_files.join(' ')}"
end

namespace :example do
  EXAMPLES.each do |name|
    desc "Run the #{name} example"
    task name.to_sym do
      dir = File.join('examples', name)

      # Install gems for any packages that have a gems.rb
      Dir
        .glob(File.join(dir, '**/gems.rb'))
        .each do |gemfile|
          pkg_dir = File.dirname(gemfile)
          lockfile = File.join(pkg_dir, 'gems.locked')
          unless File.exist?(lockfile)
            sh "cd #{pkg_dir} && BUNDLE_GEMFILE=gems.rb bundle install"
          end
        end

      sh "RUBY_BOX=1 ruby #{File.join(dir, 'main.rb')}"
    end
  end
end

desc 'Run all exapmles'
task examples: EXAMPLES.map { |n| "example:#{n}" }

desc 'Format code'
task :format do
  sh "bundle exec stree write #{STREE_FILES}"
end

task default: %i[test examples]
