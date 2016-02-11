#An example of a class
class Shape:
	def __init__(self,x,y):
		self.x = x
		self.y = y

	description = "This shape has not been described yet"
	author = "Nobody has claimed to make this shape yet"

	def area(self):
		return self.x * self.y

	def perimeter(self):
		return 2 * self.x + 2 * self.y

	def describe(self,text):
		self.description = text

	def authorName(self,text):
		self.author = text

	def scaleSize(self,scale):
		self.x = self.x * scale
		self.y = self.y * scale

#Constructor
rectangle = Shape(100,45)
#An example of a class
class Shape:
	def __init__(self,x,y):
		self.x = x
		self.y = y

	description = "This shape has not been described yet"
	author = "Nobody has claimed to make this shape yet"

	def area(self):
		return self.x * self.y

	def perimeter(self):
		return 2 * self.x + 2 * self.y

	def describe(self,text):
		self.description = text

	def authorName(self,text):
		self.author = text

	def scaleSize(self,scale):
		self.x = self.x * scale
		self.y = self.y * scale

#Constructor
#rectangle = Shape(100,45)
#print rectangle.authorName ;
#print rectangle.area ;
class Square(Shape):
    def __init__(self,x):
        self.x = x
        self.y = x
quad = Square(100,45) ;
print quad.area ;
