let sum = 12000.0
let hasCard = true

var discount = 0.0
if sum > 10000 {
    discount = 0.10
} else if sum > 5000 {
    discount = 0.05
}
if hasCard {
    discount += 0.02
}

let final = sum * (1 - discount)
print("Сумма: \(sum), скидка: \(Int(discount * 100))%, итого: \(final)")