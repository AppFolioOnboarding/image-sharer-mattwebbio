class Image < ApplicationRecord
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
