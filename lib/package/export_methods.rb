# frozen_string_literal: true

module Package
  module ExportMethods
    def deconstruct_keys(keys)
      return {} unless keys

      keys.each_with_object({}) do |key, hash|
        found, value = lookup_for_pattern(key)
        hash[key] = value if found
      end
    end

    def fetch(*keys)
      lookup(keys.first)
    end

    def fetch_values(*keys)
      keys.map { |key| fetch(key) }
    end

    private

    def lookup_for_pattern(key)
      [true, lookup(key)]
    end
  end
end
