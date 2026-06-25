
import Foundation

// ----------------------
// sorted
// ----------------------
// описание
// Метод sorted создаёт НОВЫЙ массив, оставляя первоначальный без изменений.
// - sorted() – сортировка по возрастанию для элементов, соответствующих протоколу Comparable.
// - sorted(by:) – принимает замыкание (Element, Element) -> Bool, которое определяет пользовательский порядок (должен ли первый элемент идти раньше второго).

// Пример использования встроенного метода
print("=== Встроенный sorted ===")

let numbers = [5, 2, 8, 1, 3]
let ascending = numbers.sorted()                     // [1, 2, 3, 5, 8]
let descending = numbers.sorted(by: >)               // [8, 5, 3, 2, 1]

let words = ["Swift", "is", "cool"]
let byLength = words.sorted { $0.count < $1.count }  
print("Исходный массив numbers: \(numbers)")
print("По возрастанию: \(ascending)")
print("По убыванию: \(descending)")
print("Слова по длине: \(byLength)")

// Реализция универсальной функции mySorted - Аналог sorted(by:) без использования встроенных функций высшего порядка.
/// ---Parameters:
///   array: исходный массив
///   areInIncreasingOrder: замыкание, определяющее порядок (true, если первый элемент должен идти раньше второго)
/// Returns: новый отсортированный массив
func mySorted<T>(_ array: [T], by areInIncreasingOrder: (T, T) -> Bool) -> [T] {
    var result = array
        for i in 0..<result.count {
        var minIndex = i // предполагаем, что текущий элемент уже на своём месте
        // ищу наименьший элемент в оставшейся части массива справа
        for j in (i + 1)..<result.count 
        {
            // Если элемент result[j] «меньше» текущего минимального result[minIndex]
            if areInIncreasingOrder(result[j], result[minIndex]) {
                minIndex = j 
            }
        }
        
        // Если есть подходящий элемент – меняются местами
        if minIndex != i {
            result.swapAt(i, minIndex)
        }
    }
    return result
}

// Демонстрация собственной реализации
print("\n=== Собственная реализация mySorted ===")

let sample = [7, 2, 5, 1, 9]
let myAscending = mySorted(sample, by: <)
print("Исходный массив sample: \(sample)")
print("mySorted по возрастанию: \(myAscending)") // [1, 2, 5, 7, 9]

let myDescending = mySorted(sample, by: >)
print("mySorted по убыванию: \(myDescending)")   // [9, 7, 5, 2, 1]

let myByLength = mySorted(words, by: { $0.count < $1.count })
print("mySorted слова по длине: \(myByLength)")   // ["is", "Swift", "awesome"]

// Дополнительная проверка: сортировка с чётными числами вперёд
let custom = mySorted(sample) { a, b in
    if a % 2 == b % 2 {
        return a < b          // если оба одинаковой чётности – по возрастанию
    }
    return a % 2 == 0         // чётные идут раньше нечётных
}
print("mySorted чётные вперёд: \(custom)") 

// Что творится «под капотом» у sorted
/*
 В стандартной библиотеке Swift метод sorted реализован на основе алгоритма introsort.
 
 1. Для больших подмассивов используется быстрая сортировка (quicksort): выбирается
    опорный элемент, массив разбивается на две части (меньше/больше опорного),
    и каждая часть сортируется рекурсивно.
 
 2. Если глубина рекурсии становится слишком большой (есть риск деградации до O(n²)),
    алгоритм автоматически переключается на пирамидальную сортировку (heapsort),
    которая гарантирует O(n log n) в худшем случае.
 
 3. Для очень маленьких подмассивов (например, менее 20 элементов) применяется
    сортировка вставками (insertion sort), которая на таких размерах работает
    очень быстро и минимизирует накладные расходы на вызовы.
 
P.S. Последнее узнано у нейронки, но было интересно! 
*/