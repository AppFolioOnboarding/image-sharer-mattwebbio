require 'acts-as-taggable-on'

class Image < ApplicationRecord
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
  acts_as_taggable
  acts_as_taggable_on :tags
end
