require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base

    get '/' do
        erb :user_input
    end

    post '/' do
        binding.pry
        @piglatinized_text = Piglatinizer.new(params[:string])

        erb :results
    end
end