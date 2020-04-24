require "csv" # CSVライブラリの読み込み
class TweetsController < ApplicationController
    def new
        @errors = []
    end

    # 登録処理
    def create
        @errors = Array.new

        name = params[:name]
        tweet = params[:tweet]

        # ユーザー名の空チェック
        if name.empty?
            @errors << 'ユーザー名が未入力です。'
        end
        
        # つぶやき内容の空チェック
        if tweet.empty?
            @errors << 'つぶやき内容が未入力です。'
        end
        
        # つぶやき内容の文字数チェック
        if params[:tweet].length > 140
            @errors << 'ツイートは140文字以内で入力して下さい。'
        end

        # エラーがあったら新規投稿ページを表示する
        if @errors.present?
            render 'new' and return
        end

        time = Time.now.strftime("%Y/%m/%d %H:%M:%S")
        # CSVファイルへの書き込み
        csv = CSV.open("tmp/tweets.csv", "a")
        csv.puts([name, tweet, time])
        csv.close

        # トップページへリダイレクト
        redirect_to("/")
    end
end
