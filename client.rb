#!/usr/bin/env ruby

host = '127.0.0.1'
port = 9199
name = ''

require 'jubatus/recommender/client'
require 'jubatus/recommender/types'

client = Jubatus::Recommender::Client::Recommender.new(host, port, name)

client.update_row("user01", 
                  Jubatus::Common::Datum.new("movie_A" => 5.0,
                                             "movie_B" => 2.0,
                                             "movie_C" => 3.0))

client.update_row("user02", 
                  Jubatus::Common::Datum.new("movie_A" => 2.0,
                                             "movie_B" => 5.0,
                                             "movie_C" => 1.0))

client.update_row("user03", 
                  Jubatus::Common::Datum.new("movie_A" => 5.0,
                                             "movie_B" => 1.0,
                                             "movie_C" => 4.0))

client.get_all_rows().each do |id|
  result = client.similar_row_from_id(id, 3)
  $stdout.puts "#{id} is similar to:"
  $stdout.puts "  " + result.map { |score| "#{score.id} (#{score.score})" }.join(', ')
end
