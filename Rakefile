ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

namespace :db do
  desc 'seed the database with some dummy data'
  task :seed do
    require_relative './db/seeds.rb'
  end

  task :environment do
    require_relative './config/environment'
  end

  desc 'drop into the Pry console'
  task :console => :environment do
    Pry.start
  end

  # Type `rake -T` on your command line to see the available rake tasks.
end
