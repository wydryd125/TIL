import UIKit

// 첨부된 이미지를 보고 상속을 이용해 구현해보기


class Animal {
    let brain = true
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Human: Animal {
    let name: String
    init(legs: Int, name: String) {
        self.name = name
        super.init(legs: legs)
    }
}

class Pet: Animal {
    let fleas: Int
    init(legs: Int = 4, fleas: Int) {
        self.fleas = fleas
        super.init(legs: legs)
    }
}

class Dog: Pet {
    let age: Int
    init(legs: Int = 4, fleas: Int, age: Int) {
        self.age = age
        super.init(fleas: fleas)
        
    }
    
}

class Cat: Pet {
    let kind: String
    init(legs: Int = 4, fleas: Int, kind: String) {
        self.kind = kind
        super.init(fleas: fleas)
    }
}

let animal = Animal(legs: 2)
animal.brain
animal.legs

let human = Human(legs: 2, name: "유꽁")
human.name
human.legs

let pet = Pet(fleas: 4)
pet.fleas
pet.legs

let dog = Dog(fleas: 8, age: 3)
dog.age
dog.fleas
dog.legs

let cat = Cat(fleas: 4, kind: "스코티쉬폴드")
cat.kind
cat.legs
cat.fleas
