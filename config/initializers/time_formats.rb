Time::DATE_FORMATS[:event] = lambda {|time| time.strftime("%A, %b #{time.day}, #{time.hour % 12} %p") }
