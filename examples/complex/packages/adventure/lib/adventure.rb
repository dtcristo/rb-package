# frozen_string_literal: true

# Adventure package entry point — has its own gem dependencies (faker ~> 3.0, colorize)
# Add all sibling packages' lib dirs to $LOAD_PATH for cross-package imports.
packages_dir = File.expand_path('../..', __dir__)
Dir.glob("#{packages_dir}/*/lib") do |d|
  $LOAD_PATH.unshift(d) unless $LOAD_PATH.include?(d)
end

ENV['BUNDLE_GEMFILE'] = File.expand_path('../gems.rb', __dir__)
require 'bundler/setup'

# Import faker via its bundler-managed load path (faker 3.x)
require 'faker'

# Require instead of import to get `String#colorize`
require 'colorize'

require_relative 'adventure/character'
require_relative 'adventure/narrator'

module Adventure
  def self.create_character = Character.new
  def self.create_narrator = Narrator.new
  def self.faker_version = Faker::VERSION
end

export Adventure
