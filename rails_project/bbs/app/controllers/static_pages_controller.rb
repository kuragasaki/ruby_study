require "csv" # CSVライブラリの読み込み
class StaticPagesController < ApplicationController
    def top
        @tweets = CSV.read("tmp/tweets.csv")
    end
end
