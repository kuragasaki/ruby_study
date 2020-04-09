array1 = ["東北", "関東", "中部", "近畿", "中国", "四国"]
array1.each do |chiiki|
    puts chiiki
end
array1.unshift("北海道")
puts array1[0]
array1.push("九州")
puts array1[-1]

array1.reverse.each do |chiiki|
    puts chiiki
end

array2 = array1.collect{|value| if "北海道" != value then value + "地方" else value end}
array2.each do |chiiki|
    puts chiiki
end

