# parametro padrao: arquivo de entrada
input = "testes/in.txt"

# caso precise de parametros adicionais
anotherarg = "blah"

# compilador
CC = g++

# regra default: obter os executáveis dos dois algoritmos
all: alg1 alg2

# prepara os executáveis dos dois algoritmos
alg1: alg1.o mylib.o
	$(CC) alg1.o mylib.o -o alg1

alg2: alg2.o mylib.o
	$(CC) alg2.o mylib.o -o alg2

# prepara os arquivos objetos dos dois algoritmos
alg1.o: src/alg1.cpp src/mylib.h
	$(CC) -c -I src/ src/alg1.cpp -o alg1.o

alg2.o: src/alg2.cpp src/mylib.h
	$(CC) -c -I src/ src/alg2.cpp -o alg2.o

# prepara o arquivo objeto da biblioteca
mylib.o: src/mylib.cpp src/mylib.h
	$(CC) -c -I src/ src/mylib.cpp -o mylib.o

# executa os dois algoritmos
run: runalg1 runalg2

# executa o algoritmo 1 separadamente
runalg1: alg1
	./alg1 < $(input)

# executa o algoritmo 2 separadamente
runalg2: alg2
	./alg2 < $(input)

# remove os arquivos objetos e os executáveis
clean:
	rm -f *.o alg1 alg2
