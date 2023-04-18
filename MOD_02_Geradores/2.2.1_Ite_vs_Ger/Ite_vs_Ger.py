"""
    1. Crie um iterador em Python que retorna todos os números pares.
    2. Crie um gerador em Python que retorna todos os números pares.
    3. Faça uma discussão entre as diferenças fundamentais entre as duas abordagens.
"""
"""
    Primeiro aspecto: Codificação
    Para Iteradores é usado "Class" para implementar uma "Class iteraval", então, tenho que escrever a interface: __iter__, __next__ .
    No caso de geradores não, eu uso simplesmente uma função para definir uma "Class" de gerador.

    Segundo aspecto: execução
    Usando iteradores é preservado o valor do "meu estado".
    Enquando que para os geradores, é preservado um contexto
    que inclui o "meu estado" e o "program counter" de cada gerador.
"""

class Itepares():
    def __iter__ (self):
        self.par = 0
        return self
    
    def __next__ (self):
        self.par += 2
        return self.par
		

def Gerpares():
    par = 2
    while (True):
        yield(par)
        par += 2

for n in Gerpares():
    print(n)