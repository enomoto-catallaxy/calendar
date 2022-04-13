require  'date'
require 'optparse'
opt = OptionParser.new

today = Date.today

    year = today.year

    dweek = Date.new(year,month,1).wday

    last_day = Date.new(year,month,-1).day
    day_array = [*1..last_day]

    dweek.times do
    day_array.unshift(" ")
    end

    weeks_count = day_array.length / 7
    weeks_count += 1 if day_array.length % 7 > 0

    calender_title = Date.new(year,month,1).strftime("%B %Y")
    calender_head = ["Su","Mo","Tu","We","Th","Fr","Sa"]

    puts calender_title.center(21," ")
    puts " " + calender_head.join(" ")

    weeks_count.times do
    week = day_array.shift(7)

    if week[6] == nil
        week.map {|e| e ? e : " " }
    end

    printf("%3s%3s%3s%3s%3s%3s%3s\n",
            week[0],week[1],week[2],week[3],week[4],week[5],week[6])
    end


