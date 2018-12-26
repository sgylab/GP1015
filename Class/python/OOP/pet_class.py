class Pet:
    def __init__(self, name=None, sound=None, food=None):
        self.name = name
        self.sound = sound
        self.food = food
        self.__talk()

    def __talk(self):
        print('My name is ' + self.name + ', ' + self.sound + '!')

    def eat(self, food):
        if food == self.food:
            print(self.name + " eats the " + food + ".")
        else:
            print(self.name + ": ......")


class Dog(Pet):
    sound = "bark"
    food = "bone"

    def __init__(self, name):
        super().__init__(name, self.sound, self.food)


class Cat(Pet):
    sound = "meow"
    food = "fish"

    def __init__(self, name):
        super().__init__(name, self.sound, self.food)


cat = Cat("Lily")
dog = Dog("Mark")
pet_list = [cat, dog]


def calls(pet):
    print(pet.name, pet.sound)


for pet in pet_list:
    calls(pet)
