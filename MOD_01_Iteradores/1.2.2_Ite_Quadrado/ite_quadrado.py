"""
	Considere um personagem que se move em um
	mapa nas 4 direções: “dir”, “esq”, “cima”, “baixo”.
	Crie um iterador em Python em que o
	personagem faça um movimento contínuo 
	“em quadrado”, com 10 passos seguidos em cada direção.
"""

class Quadrado:
	def __init__ (self):
		self.direcoes = ["cima", "direita", "baixo", "esquerda"]

	def __iter__ (self):
		self.curr_direc = 0;
		self.count_ite  = 0;
		return self

	def __next__ (self):
		if( self.count_ite == 10 ):
			self.curr_direc =  (self.curr_direc + 1) % 4
			self.count_ite = 0;
		self.count_ite += 1
		return self.direcoes[self.curr_direc]


for dir in Quadrado():
	print(dir)
