require "date"
require "optparse"

def calender_month(year: Date.today.year, month: Date.today.month)

		firstday = Date.new(year, month, 1)
		lastday = Date.new(year, month, -1)

		first_wday = firstday.wday
		lastday_date = lastday.day

		puts firstday.strftime("%m月 %Y").center(20)
		puts "日 月 火 水 木 金 土"
		wday = firstday.wday
		print " " * wday

		days = (1..lastday_date).map{ |n| n.to_s.rjust(2)}
		days = Array.new(first_wday, ' ').push(days).flatten.each_slice(7).to_a

		days.each do |week|
			puts week.join(' ')
		end
		print "\n"
end

def option_parse
    options = {}
  
    OptionParser.new do |opts|
      opts.on('-y') do |v|
        options[:year] = v.to_i
      end
      opts.on('-m') do |v|
        options[:month] = v.to_i
      end
    end.parse!
  
    options
  end

  calender_month(**option_parse)

