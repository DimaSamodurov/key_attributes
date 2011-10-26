require "key_attributes/version"

# a MongoMapper plugin allowing to access attributes of top level of a document, skipping associations
module KeyAttributes
  extend ActiveSupport::Concern

  included do
    #
  end

  # Returns attributes of single level
  module InstanceMethods
    def key_attributes(options = {except: '_id'})
      keys = self.key_names
      keys = [options[:only]].flatten.map(&:to_s) if options[:only]
      keys = keys - [options[:except]].flatten.map(&:to_s) if options[:except]
      Hash[keys.map{|key| [ key, self[key] ] }]
    end
  end
end

