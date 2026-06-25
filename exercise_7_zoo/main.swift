let zoo = Zoo()

zoo.add(Wolf(name: "Акела"))
zoo.add(Cat(name: "Вася"))
zoo.add(Chicken(name: "Ряба"))
zoo.add(Bear(name: "Миша"))

print("=== Зоопарк создан! ===")
print("Вот сколько \(zoo.animals.count) в зоопарке животных\n")

zoo.runSimulation(days: 10)

print("\n=== Симуляция зоопарка завершена ===")
print("статистика:")
zoo.animals.forEach { $0.info() }