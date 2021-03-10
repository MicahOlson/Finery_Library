require 'rspec'
require 'pry'
require 'pg'
require 'book'
require 'patron'
require 'author'
require 'spec_pass'

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
  end
end
