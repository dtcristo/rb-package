# frozen_string_literal: true

# Loot package entry point — has its own gem dependency (faker ~> 3.0)
# Each package box gets its own isolated Faker constant even when using the same
# gem version — demonstrating Ruby::Box namespace isolation.
# Add all sibling packages' lib dirs to $LOAD_PATH for cross-package imports.
packages_dir = File.expand_path('../..', __dir__)
Dir.glob("#{packages_dir}/*/lib") do |d|
  $LOAD_PATH.unshift(d) unless $LOAD_PATH.include?(d)
end

ENV['BUNDLE_GEMFILE'] = File.expand_path('../gems.rb', __dir__)
require 'bundler/setup'

# Import faker via its bundler-managed load path; Faker here lives in loot's
# own box namespace — completely separate from adventure's Faker constant.
require 'faker'

require 'loot/item'

# Cross-package import by name (quest lib is on $LOAD_PATH)
Quests = import('quest')

module Loot
  def self.random_drop(difficulty: :medium)
    tier =
      case difficulty
      when :easy
        :common
      when :medium
        :uncommon
      when :hard
        :rare
      when :legendary
        :epic
      else
        :common
      end
    flavor = Faker::Games::ElderScrolls.creature
    Item.random(tier, flavor)
  end

  def self.faker_version = Faker::VERSION
end

export(
  Loot:,
  random_drop: Loot.method(:random_drop),
  VERSION: '0.1.0',
  FAKER_VERSION: Faker::VERSION,
)
