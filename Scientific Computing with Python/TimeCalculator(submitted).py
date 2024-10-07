def add_time(start, duration,weekday=''):

    week_days = ['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
    s_hours,s_mins = start.split(':')
    s_mins,period = s_mins.split(' ')
    d_hours,d_mins = duration.split(':')

    s_hours = int(s_hours)
    s_mins = int(s_mins)
    d_hours = int(d_hours)
    d_mins = int(d_mins)
    period = period.strip().lower()

    total_hours = s_hours + d_hours
    total_mins = s_mins + d_mins

    if period == 'pm':
        total_hours += 12

    final_mins = int(total_hours*60 + total_mins)

    new_hours = final_mins // 60 % 24
    new_mins = final_mins % 60
    days_later = final_mins // (24 * 60)

    new_period = 'AM'
    
    if new_hours==0:
        new_hours=12
    elif new_hours >= 12:
        new_period = 'PM'
        if new_hours > 12:
            new_hours -= 12
    else:
        new_period = 'AM'

    new_time = '{:d}:{:02d} {}'.format(new_hours, new_mins, new_period)

    
    

    if weekday:
        weekday_index = week_days.index(weekday.lower())
        new_day_index = (weekday_index + days_later) % 7
        new_day = week_days[new_day_index]
        new_time += ', ' + new_day.title()
    
    

    if days_later == 1:
        new_time += ' (next day)'
    elif days_later > 1:
        new_time += ' ({} days later)'.format(days_later)

    return new_time


x=add_time('11:59 PM', '24:05', 'Wednesday')
print(x)