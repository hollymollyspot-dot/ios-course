// =======================================================================
// статистика фитнес-центра (это дз: придумайте себе занятие с замыканием)
// =======================================================================

// Данные: количество посетителей фитнес центкра по дням (за 30 дней)
let visitors = [45, 120, 78, 32, 95, 110, 55, 88, 67, 130,
                42, 99, 73, 28, 115, 82, 61, 105, 48, 91,
                76, 34, 123, 89, 57, 102, 69, 44, 100, 80]

// Порог посещаемости – переменная, захватываемая замыканием
var threshold = 70
print("Порог высокой посещаемости: \(threshold)")

let highTraffic = visitors.filter { day in
    day >= threshold
}
print("Дни с высокой посещаемостью >= \(threshold): \(highTraffic)")

let sortedHigh = highTraffic.sorted { $0 > $1 }
print("Отсортировано по убыванию: \(sortedHigh)")

let comments = sortedHigh.map { count -> String in
    switch count {
    case 100...: return "\(count) 🔥 Очень много"
    case 70..<100: return "\(count) 👍 Больше, чем нужно"
    case 40..<70: return "\(count) 😐 Терпимо"
    default: return "\(count) 😴 Мало - кайфово"
    }
}
print("с оценками: \(comments)")

let avg = sortedHigh.reduce(0, +) / sortedHigh.count
print("Средняя посещаемость по дням: \(avg)")

// САМЫЙ ЗАГРУЖЕННЫЙ И НАИМЕНЕЕ ЗАГРУЖЕННЫЙ ДЕНЬ

if let mostPopular = sortedHigh.first, let leastPopular = sortedHigh.last {
    print("Самый загруженный день: \(mostPopular) посетителей")
    print("Наименее загруженный день: \(leastPopular) посетителей")
} else {
    print("ошибочка")
}

// ИЗМЕНЕНИЕ ПОРОГА 
threshold = 90
print("Новый порог: \(threshold)")

let highTraffic2 = visitors.filter { $0 >= threshold }
print("Дни с новой посещаемостью >= \(threshold): \(highTraffic2)")

let sortedHigh2 = highTraffic2.sorted { $0 > $1 }
if let mostPopular2 = sortedHigh2.first, let leastPopular2 = sortedHigh2.last {
    print("Самый загруженный (новый порог): \(mostPopular2) посетителей")
    print("Наименее загруженный (новый порог): \(leastPopular2) посетителей")
} else {
    print("Нет данных для нового порога")
}