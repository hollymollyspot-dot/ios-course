let nums = [3, -1, 0, 7, -5, 0, 9, -2]

var pos = 0, neg = 0, zero = 0, maxVal = nums[0], sum = 0

for n in nums {
    if n > 0 { pos += 1 }
    else if n < 0 { neg += 1 }
    else { zero += 1 }
    if n > maxVal { maxVal = n }
    sum += n
}

print("Положительных: \(pos)")
print("Отрицательных: \(neg)")
print("Нулевых: \(zero)")
print("Максимум: \(maxVal)")
print("Сумма: \(sum)")