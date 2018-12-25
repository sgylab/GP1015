class Cat:
    def __init__(self, name=None):
        self.name = name
        self.sound = "meow"
        self.food = "fish"
        self.__talk()

    def __talk(self):
        print('My name is ' + self.name + ', ' + self.sound + '!')

    def eat(self, food):
        if food == self.food:
            print(self.name + " eats the " + food + ".")
        else:
            print(self.name + ": ......")


rick = Cat("Rick")

rick.eat("fish")
rick.eat("apple")

