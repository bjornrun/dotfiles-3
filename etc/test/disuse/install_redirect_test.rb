#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'
require 'pp'

class ShortURL
  def self.expand(short_url)
    # http://longurl.org/api
    connection = Net::HTTP.new('api.longurl.org')
    connection.start do |http|
      headers = {
        'Referer' => '',
        'User-Agent' => ''
      }

      path = "/v2/expand?url=#{URI.encode(short_url)}&format=json"
      response = http.request_get(path, headers)

      data = JSON.parse(response.body)

      if data['messages']
        raise data['messages'][0]['message']
      end

      data['long-url']
    end
  end
end

 
redirect = "https://raw.githubusercontent.com/bjornrun/dotfiles-3/master/etc/install".split("/")
shorten = ShortURL.expand('http://dot.bjornrun.com').split("/")

exit(1) unless redirect[3..-1].join("/") == shorten[3..-1].join("/")
