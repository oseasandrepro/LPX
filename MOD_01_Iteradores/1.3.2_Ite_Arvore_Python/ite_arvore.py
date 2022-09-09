"""
	Crie um iterador em Python que receba uma
	arvore e retorne todas as folhas, da esquerda para a direita.
	Variante 2: use um pilha auxiliar como estado
"""



class Arvore:
	def populate_stack(self, arvore):
		if( not isinstance(arvore, list) ):
			self.Stack.append(arvore)
		else:
			for i in range(len(arvore)-1, -1, -1):
				self.populate_stack(arvore[i])
					
	def __init__ (self, a):
		self.last_index = len(a)-1
		self.Stack = []
		self.arvore = a

	def __iter__ (self):
		self.current_index = 0
		self.populate_stack(self.arvore[self.current_index])
		return self


	def __next__ (self):
		if(self.current_index < self.last_index and len(self.Stack)>0):
			return self.Stack.pop();
		elif(self.current_index > self.last_index and len(self.Stack)>0):
			return self.Stack.pop()
		elif(self.current_index < self.last_index and len(self.Stack)==0):
			self.current_index += 1
			self.populate_stack(self.arvore[self.current_index])
			return self.Stack.pop();
		else:
			raise StopIteration


a = ["aaa", ["xxx","yyy"], "bbb"]

for f in Arvore(a):
	print(f)
