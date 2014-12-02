package clock

import "fmt"

const TestVersion = 1

type Clock struct {
	hours, minutes int
}

func New(h int, m int) Clock {
	clock := Clock{0, 0}

	minutes, extraHour := clock.addMinutes(m)

	hour := clock.addHour(h + extraHour)

	clock.hours = hour
	clock.minutes = minutes

	return clock
}

// returns minutes, and extra hours
func (c Clock) addMinutes(m int) (int, int) {
	newMinutes := (c.minutes + m) % 60
	extraHours := int((c.minutes + m) / 60)

	if newMinutes < 0 {
		newMinutes = newMinutes + 60
		extraHours -= 1
	}

	return newMinutes, extraHours
}

func (c Clock) addHour(h int) int {
	hour := (c.hours + h) % 24
	hour = hour
	if hour < 0 {
		hour = c.addHour(h + 24)
	}
	return hour
}

func (c Clock) Add(m int) Clock {
	minutes, extraHour := c.addMinutes(m)
	hour := c.addHour(extraHour)
	c.minutes = minutes
	c.hours = hour
	return c
}

func (c *Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hours, c.minutes)
}
