require "csv" # CSVライブラリの読み込み

class ContactsController < ApplicationController
    def top
        @errors = Array.new
    end

    def send_message
        @errors = Array.new
        name = params[:name]
        mail = params[:mail]
        message = params[:message]

        if name.empty?
            @errors << "ユーザー名が未入力です。"
        end

        if mail.empty?
            @errors << "メールアドレスが未入力です。"
        end

        if message.empty?
            @errors << 'お問い合わせ内容が未入力です。'
        end

        if message.length > 500
            @errors << 'お問い合わせ内容は500文字以内で入力して下さい。'
        end

        if @errors.present?
          render 'top' and return
        end

        time = Time.now.strftime("%Y/%m/%d %H:%M:%S")

        # CSVファイルへの書き込み
        csv = CSV.open("tmp/contacts.csv", "a")
        csv.puts([name, mail, message, time])
        csv.close

        # トップページへリダイレクト
        redirect_to("/")
    end
end
