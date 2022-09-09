"""
	Crie um iterador em Python que receba uma
	string e retorne todos os caracteres da string, um por um.
"""

class Caracteres:
	def __init__ (self, str):
		self.my_str = str;
		self.last_index = len(str)-1

	def __iter__(self):
		self.current_index = 0
		return self

	def __next__(self):
		if( self.current_index > self.last_index):
			raise StopIteration
		else:
			index = self.current_index
			self.current_index += 1
			return self.my_str[index]
# teste
for c in Caracteres("ola mundo"):
    print(c)
