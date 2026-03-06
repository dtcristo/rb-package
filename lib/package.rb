# frozen_string_literal: true

raise 'Ruby 4.0+ is required for Package' if RUBY_VERSION.to_f < 4.0

module Package
end

require_relative 'package/export_methods'
require_relative 'package/exports'
require_relative 'package/box'
require_relative 'package/runtime'
require_relative 'package/kernel_patch'

module Package
  private_constant :ExportMethods
  private_constant :Runtime
  private_constant :KernelPatch
end
