require("date")

days = Date.today
puts days
puts days + 10
days += 10
puts days.strftime("%Y / %m ( %h ) %B  / %d   %H ( %I ) : %M : %S")

txt_write = []
# ファイル操作
file_rb = File.open("ruby_only/study1.rb", "r")
file_rb.each_line do |line|
    txt_write.push(file_rb.lineno.to_s + " : " + line)
end
file_rb.close 

txt_write.each do |value|
    puts value
end
#file_txt = File.open("test.txt", "a")
#file_txt.close 
