class Cat: Animal {
    var name: String?
}

class Animal {
    var age: Int?
}

struct Dog: AnimalB {
    var name: String?
}

struct AnimalB {
    var age: Int?
}

let yellowCat = Cat()
yellowCat.name = "Whiskers"
yellowCat.age = 3
print(yellowCat.name as Any)

var yellowDog = Dog()
yellowDog.name = "Bruno"
print(yellowDog.name as Any)

let yellowStrayCat = yellowCat
yellowStrayCat.name = "Smokey"
print(yellowStrayCat.name)
print(yellowCat.name)

var yellowStrayDog = yellowDog
yellowStrayDog.name = "Max"
print(yellowStrayDog.name)
print(yellowDog.name)


