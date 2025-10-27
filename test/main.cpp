#include <iostream>
#include <cassert>
#include "bib.hpp"

bool testarCalcularFatorial() {
     assert(calcularFatorial(5) == 120);
     return true;
}

int main() {
    
    if (testarCalcularFatorial()) {
        std::cout << "✅ Teste passou! " << std::endl;
        return 0;
    } else {
        std::cout << "❌ Teste falhou! "<< std::endl;
        return 1;
    }
}
