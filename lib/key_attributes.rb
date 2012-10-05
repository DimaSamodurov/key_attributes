require "key_attributes/version"

# a MongoMapper plugin allowing to access attributes of top level of a document, skipping associations
module KeyAttributes
  extend ActiveSupport::Concern

  included do
    #
  end

  # Returns attributes of single level
  def key_attributes(options = {except: ['_id', 'created_at', 'updated_at']})
    keys = self.key_names
    keys = [options[:only]].flatten.map(&:to_s) if options[:only]
    keys = keys - [options[:except]].flatten.map(&:to_s) if options[:except]
    Hash[keys.map{|key| [ key.to_sym, self.send(key) ] }].with_indifferent_access
  end
end

