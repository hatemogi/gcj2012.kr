IDX = 0
NEXT_IDX = 1
LINES = 2

def calc idx, dpm, dpw
  lines = (dpm + idx) / dpw
  next_idx = (dpm + idx) % dpw
  lines += 1 unless next_idx == 0
  [idx, next_idx, lines]
end

def solve mpy, dpm, dpw
  total = 0
  idx = 0
  found = []
  while mpy > 0
    if r = found.find {|t| t[IDX] == idx}
      shortcut = found.drop_while {|t| t[IDX] != idx}
      cycles = mpy / shortcut.size
      leftover = mpy % shortcut.size
      STDERR.puts "found => #{found}, shortcut => #{shortcut}, cycle => #{cycles}, leftover => #{leftover}"
      if cycles > 0 
        total += cycles * shortcut.inject(0) {|m, t| m + t[LINES]} 
        mpy -= cycles * shortcut.size
      end
      if leftover > 0
        total += shortcut.first(leftover).inject(0) {|m, t| m + t[LINES]}
        mpy -= leftover
      end
    else
      found << (t = calc idx, dpm, dpw)
      total += t[LINES]
      idx = t[NEXT_IDX]
      mpy -= 1
    end
  end
  total
end

gets.to_i.times do |no|
  mpy, dpm, dpw = gets.split.collect(&:to_i)
  puts "Case ##{no+1}: #{solve mpy, dpm, dpw}"  
end
