let str = "123"

if let num = Int(str) {
    let res = num + 10
    print("Результат: \(res)")
} else {
    print("Ошибка: не удалось преобразовать строку")
}