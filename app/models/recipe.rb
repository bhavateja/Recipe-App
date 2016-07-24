ENV['FOOD2FORK_KEY'] = '2a2f3bc9aa002924d7a2f27719c0ee89'
ENV['FOOD2FORK_SERVER_AND_PORT'] = 'www.food2fork.com'

class Recipe < ActiveRecord::Base
  include HTTParty
  #hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{ENV['FOOD2FORK_SERVER_AND_PORT']}/api"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for term
    get('/search', query: {q: term})['recipes']
  end
end
