func dayType(_ n: Int) -> String {
    switch n {
    case 1...5: return "Рабочий"
    case 6...7: return "Выходной"
    default: return "Ошибка"
    }
}

for i in 1...8 {
    print("\(i): \(dayType(i))")
}