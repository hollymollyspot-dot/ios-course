let dayOfBirth = 12
let monthOfBirth = 03 
let yearOfBirth = 2003
let currentDay = 24
let currentMonth = 6
let currentYear = 2026
let years = currentYear - yearOfBirth
let months = years * 12 + (currentMonth - monthOfBirth)
let days = years * 365 + (currentMonth - monthOfBirth) * 30 + (currentDay - dayOfBirth)
let seconds = days * 24 * 60 * 60
print("\(years) years, \(months) months, \(days) days and \(seconds) seconds have passed since my birth")
if monthOfBirth >= 1 && monthOfBirth <= 3 {
    print("Я родился в первом квартале")
} else if monthOfBirth >= 4 && monthOfBirth <= 6 {
    print("Я родился во втором квартале")
} else if monthOfBirth >= 7 && monthOfBirth <= 9 {
    print("Я родился в третьем квартале")
} else if monthOfBirth >= 10 && monthOfBirth <= 12 {
    print("Я родился в четвёртом квартале")
} else {
    print("Некорректный месяц")
}