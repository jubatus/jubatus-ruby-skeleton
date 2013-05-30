#!/usr/bin/env ruby

host = 'localhost'
port = 9199
name = ''

require 'jubatus/recommender/client'
require 'jubatus/recommender/types'

client = Jubatus::Recommender::Client::Recommender.new(host, port)

client.update_row(name, 
                  "user01", 
                  Jubatus::Recommender::Datum.new([],
                                                  [["movie_A", 5.0],
                                                   ["movie_B", 2.0],
                                                   ["movie_C", 3.0]]))

client.update_row(name, 
                  "user02", 
                  Jubatus::Recommender::Datum.new([],
                                                  [["movie_A", 2.0],
                                                   ["movie_B", 5.0],
                                                   ["movie_C", 1.0]]))

client.update_row(name, 
                  "user03", 
                  Jubatus::Recommender::Datum.new([],
                                                  [["movie_A", 5.0],
                                                   ["movie_B", 1.0],
                                                   ["movie_C", 4.0]]))

client.get_all_rows(name).each do |id|
  result = client.similar_row_from_id(name, id, 3)
  $stdout.puts "#{id} is similar to:"
  $stdout.puts "  " + result.map { |score| "#{score[0]} (#{score[1]})" }.join(', ')
end
