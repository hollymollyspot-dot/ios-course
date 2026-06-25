let age = 25

switch age {
case 0...12:
    print("Ребенок")
case 13...17:
    print("Подросток")
case 18...64:
    print("Взрослый")
case 65...:
    print("Пенсионер")
default:
    print("Ошибка: некорректный возраст")
}