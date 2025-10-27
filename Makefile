# Compilador e flags
CXX = g++
CXXFLAGS = -Iinclude -Wall -std=c++17

# Diretórios
SRC_DIR = src
INC_DIR = include
BIN_DIR = bin
TEST_DIR = test

# Arquivos fonte do projeto
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BIN_DIR)/%.o)

# Executáveis
TARGET = $(BIN_DIR)/main.exe
TEST_TARGET = $(BIN_DIR)/testeRegressivo.exe

# =========================================
# Compilação do projeto principal
# =========================================
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# =========================================
# Compilação dos testes
# =========================================
test: $(TEST_TARGET)

$(TEST_TARGET): $(SRCS) $(TEST_DIR)/main.cpp
	$(CXX) $(CXXFLAGS) $(TEST_DIR)/main.cpp $(SRCS) -o $(TEST_TARGET)
	@echo "Executando testes..."
	@./$(TEST_TARGET)

# =========================================
# Limpeza
# =========================================
clean:
	rm -f $(BIN_DIR)/*.o $(BIN_DIR)/*.exe

.PHONY: all clean test

#_______________________________________________________________________________________COLA_________________________________________________________________
## Compilar o projeto principal
#make

# Executar o programa
#./bin/main.exe

# Compilar e rodar os testes
#make test

# Limpar os binários
#make clean
#
#
#
