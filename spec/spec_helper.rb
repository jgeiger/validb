require File.expand_path(File.dirname(__FILE__) + '/../lib/validb')

require "pry"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
end

RSpec::Matchers::OperatorMatcher.register(ActiveRecord::Relation, '=~', RSpec::Matchers::BuiltIn::MatchArray)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :blogs, :force => true do |t|
    t.string :title
    t.timestamps
  end

  create_table :posts, :force => true do |t|
    t.string :title
    t.timestamps
  end

  create_table :comments, :force => true do |t|
    t.string :body
    t.timestamps
  end
end

class Blog < ActiveRecord::Base
  validates :title, presence: true
end

class Post < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end
