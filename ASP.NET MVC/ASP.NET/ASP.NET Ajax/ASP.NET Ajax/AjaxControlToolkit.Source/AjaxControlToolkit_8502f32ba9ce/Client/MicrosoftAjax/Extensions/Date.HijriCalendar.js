__cultureInfo.dateTimeFormat.Calendar.convert = {
    // Adapted to Script from System.Globalization.HijriCalendar
    ticks1970: 62135596800000,
    // number of days leading up to each month
    monthDays: [0, 30, 59, 89, 118, 148, 177, 207, 236, 266, 295, 325, 355],
    minDate: -42521673600000,
    maxDate: 253402300799999,
    adjustment: __cultureInfo.dateTimeFormat.Calendar._adjustment || 0,
    toGregorian: function(hyear, hmonth, hday) {
        var daysSinceJan0101 = this.daysToYear(hyear) + this.monthDays[hmonth] + hday - 1 - this.adjustment;
        // 86400000 = ticks per day
        var gdate = new Date(daysSinceJan0101 * 86400000 - this.ticks1970);
        // adjust for timezone, because we are interested in the gregorian date for the same timezone
        // but ticks in javascript is always from GMT, unlike the server were ticks counts from the base
        // date in the current timezone.
        gdate.setMinutes(gdate.getMinutes() + gdate.getTimezoneOffset());
        return gdate;
    },
    fromGregorian: function(gdate) {
        if ((gdate < this.minDate) || (gdate > this.maxDate)) return null;
        var ticks = this.ticks1970 + (gdate-0) - gdate.getTimezoneOffset() * 60000,
            daysSinceJan0101 = Math.floor(ticks / 86400000) + 1 + this.adjustment;
        // very particular formula determined by someone smart, adapted from the server-side implementation.
        // it approximates the hijri year.
        var hday, hmonth, hyear = Math.floor(((daysSinceJan0101 - 227013) * 30) / 10631) + 1,
            absDays = this.daysToYear(hyear),
            daysInYear = this.isLeapYear(hyear) ? 355 : 354;
        // hyear is just approximate, it may need adjustment up or down by 1.
        if (daysSinceJan0101 < absDays) {
            hyear--;
            absDays -= daysInYear;
        }
        else if (daysSinceJan0101 === absDays) {
            hyear--;
            absDays = this.daysToYear(hyear);
        }
        else {
            if (daysSinceJan0101 > (absDays + daysInYear)) {
                absDays += daysInYear;
                hyear++;
            }
        }
        // determine month by looking at how many days into the hyear we are
        // monthDays contains the number of days up to each month.
        hmonth = 0;
        var daysIntoYear = daysSinceJan0101 - absDays;
        while (hmonth <= 11 && daysIntoYear > this.monthDays[hmonth]) {
            hmonth++;
        }
        hmonth--;
        hday = daysIntoYear - this.monthDays[hmonth];
        return [hyear, hmonth, hday];
    },
    daysToYear: function(year) {
        // calculates how many days since Jan 1, 0001
        var yearsToYear30 = Math.floor((year - 1) / 30) * 30,
            yearsInto30 = year - yearsToYear30 - 1,
            days = Math.floor((yearsToYear30 * 10631) / 30) + 227013;
        while (yearsInto30 > 0) {
            days += (this.isLeapYear(yearsInto30) ? 355 : 354);
            yearsInto30--;
        }
        return days;
    },
    isLeapYear: function(year) {
        return ((((year * 11) + 14) % 30) < 11);
    }
}
