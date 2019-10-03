require "net/http"
require "uri"
require "json"
require_relative 'classes/review'

def reviews_getter(arg_uri)
  begin
    uri = URI.parse(arg_uri)
    document = Net::HTTP.get(uri)

    raw_json_data = JSON.parse(document)

    hashed_data = {
      :total => raw_json_data["total"],
      :filteredCount => raw_json_data["filteredCount"],
      :result => raw_json_data["result"],
      :reviews => raw_json_data["result"]["reviews"],
    }

    reviews_to_return = []

    hashed_data[:reviews].each do |hash|
      reviews_to_return << Review.new(uri, hash)
    end

    return reviews_to_return
  rescue
    return 'bad request in reviews_getter for: ' + arg_uri
  end
end
