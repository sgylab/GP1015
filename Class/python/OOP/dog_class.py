class Dog:
    def __init__(self, name=None):
        self.name = name
        self.sound = "bark"
        self.food = "bone"
        self.__talk()

    def __talk(self):
        print('My name is ' + self.name + ', ' + self.sound + '!')

    def eat(self, food):
        if food == self.food:
            print(self.name + " eats the " + food + ".")
        else:
            print(self.name + ": ......")


doge = Dog("Doge")

doge.eat("bone")
doge.eat("apple")
