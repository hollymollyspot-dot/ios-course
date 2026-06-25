class Animal {
    let name: String
    let type: String      
    var age: Int
    let maxAge: Int
    var hunger: Int       
    var alive: Bool
    let reproChance: Int  
    let foodNeed: Int     
    init(name: String, type: String, maxAge: Int, reproChance: Int, foodNeed: Int) {
        self.name = name
        self.type = type
        self.age = 1
        self.maxAge = maxAge
        self.hunger = 0
        self.alive = true
        self.reproChance = reproChance
        self.foodNeed = foodNeed
    }

    func eat() {
        if alive {
            hunger = 0
            print("\(name) (\(type)) поел.")
        }
    }
    func grow() {
        if alive {
            age += 1
            hunger += 1
            print("\(name) (\(type)) стал старше. Возраст: \(age)")
        }
    }
    func tryReprod() -> Animal? {
        guard alive else { return nil }
        let roll = Int.random(in: 1...100)
        if roll <= reproChance {
            print("У \(name) родился потомок!")
            // создаём нового животного того же типа
            return Animal(name: "\(type)#\(Int.random(in: 1...999))",
                          type: type,
                          maxAge: maxAge,
                          reproChance: reproChance,
                          foodNeed: foodNeed)
        }
        return nil
    }

    func die(cause: String) {
        if alive {
            alive = false
            print("\(name) (\(type)) умер от \(cause).")
        }
    }
    func isDead() -> Bool {
        if !alive { return true }
        if age > maxAge {
            die(cause: "старости")
            return true
        }
        if hunger >= 10 {
            die(cause: "голода")
            return true
        }
        return false
    }

    func info() {
        print("\(name) (\(type)), возраст: \(age), голод: \(hunger), жив: \(alive)")
    }
}