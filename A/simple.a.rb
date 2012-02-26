def solve mpy, dpm, dpw
  lines = 0
  idx = 0
  mpy.times do |m|
    lines += (dpm + idx) / dpw
    idx = (dpm + idx) % dpw
    lines += 1 unless idx == 0
  end
  lines
end

gets.to_i.times do |no|
  mpy, dpm, dpw = gets.split.collect(&:to_i)
  puts "Case ##{no+1}: #{solve mpy, dpm, dpw}"  
end
