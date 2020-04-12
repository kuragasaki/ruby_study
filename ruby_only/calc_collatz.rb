# 計算用関数
def collatz(num)
    if num % 2 == 0
        return num / 2
    else
        return num * 3 + 1
    end
end

num = -1
while num == -1
    begin
        puts "整数を入力してください : "
        num = Integer($stdin.gets)
    rescue => ex
        puts "もう一度、"
    end
end
           
until num == 1
    num = collatz(num)
    puts num
end
