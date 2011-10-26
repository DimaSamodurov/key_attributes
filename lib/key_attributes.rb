require "key_attributes/version"

# a MongoMapper plugin allowing to access attributes of top level of a document, skipping associations
module KeyAttributes
  extend ActiveSupport::Concern

  included do
    #
  end

  # Returns attributes of single level
  module InstanceMethods
    def key_attributes
      Hash[self.key_names.map{|key| [ key, self[key] ] }]
    end
  end
end

