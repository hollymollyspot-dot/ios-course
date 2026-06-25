
class Zoo {
    var animals: [Animal] = []
    var bornCount = 0
    var deadCount = 0

    func add(_ animal: Animal) {
        animals.append(animal)
    }

    func removeDead() {
        animals = animals.filter { $0.alive }
    }

    func runDay() {
        bornCount = 0
        deadCount = 0

        for animal in animals {
            // 1. Старение
            animal.grow()

            // 2. Еда (50% шанс найти еду)
            if Int.random(in: 1...100) <= 50 {
                animal.eat()
            } else {
                print("\(animal.name) (\(animal.type)) не нашёл еду. Голод: \(animal.hunger)")
            }

            // 3. Размножение (если жив)
            if animal.alive && Int.random(in: 1...100) <= 30 {
                if let baby = animal.tryReprod() {
                    animals.append(baby)
                    bornCount += 1
                }
            }

            // 4. Проверка смерти
            if animal.isDead() {
                deadCount += 1
            }
        }

        // 5. Убираем мёртвых
        removeDead()

        // 6. Статистика дня
        print("\n=== Статистика дня ===")
        print("Всего животных: \(animals.count)")
        print("Родилось: \(bornCount)")
        print("Умерло: \(deadCount)")
        print("Видовой состав:")
        let counts = Dictionary(grouping: animals, by: { $0.type })
        for (type, list) in counts {
            print("  \(type): \(list.count)")
        }
        print()
    }

    func runSimulation(days: Int) {
        for day in 1...days {
            print("=== День \(day) ===")
            runDay()
        }
    }
}