
# parse_ycb_timetable.rb
# 横浜市交通局(市営バス)の各バス停停車時刻表をパースする
# 入力: HTMLファイル(停車時刻表)
# 出力: 「時刻 バス停」
require 'nokogiri'

# Nokogiri によるパース
doc = File.open(ARGV[0]) do |f|
  Nokogiri::HTML(f)
end

# 各バス停の時刻、バス停名称は、divタグ以下の子要素(spanタグ)にある
doc.xpath("//div[@class='btm' or @class='target' or @class='btm_target']").each do |item|
  # 2番目の子要素: 時刻
  print item.children[1].text.strip
  print " "

  # 4番目の子要素: バス停名称
  puts item.children[3].text.strip.split("\n")[0]
end
