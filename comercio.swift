import Foundation
import Swift

struct produto{
    var cod: Int
    var nome: String
    var preco: Float
}

func menu() -> String {
    
    while (true) {
        print("\nEscolha a operacao abaixo: ")
        print("\n0- Sair\n1- Ver Produtos \n2- Adicionar Produto \n3- Excluir Produto\nEscolha: ")
        //VARIAVEL DINAMICA
        let opcao: String = readLine()!
        if( (opcao != "0") && (opcao != "1") && (opcao != "2") && (opcao != "3")){
            print("\nEscolha uma opcao valida!!\n")
            continue
        }else {
            return opcao
        }
    }
    return "0"
}

func addProd() -> produto {
    print("\nDigite um codigo: ")
    let codigo = Int(readLine()!) ?? 0
    print("\nDigite um Nome: ")
    let name: String = readLine()!
    print("\nDigite um preco: ")
    let precoProd = Float(readLine()!) ?? 0

    return produto(cod: codigo, nome: name, preco: precoProd)
}

func ver(prods: [produto]) -> Void{
    var num: Int = 0
    for item in prods{
        print("\nITEM: \(num) \nCODIGO: \(item.cod) \nNome: \(item.nome) \nPRECO: \(item.preco)")
        print("-------------")
        num += 1;
    }
}
func verItem(prods: [produto], item: Int) -> Void{
    print("\nITEM: \(item) \nCODIGO: \(prods[item].cod) \nNome: \(prods[item].nome) \nPRECO: \(prods[item].preco)")
        print("-------------")
}

func excluir(prods: inout[produto]) -> Void{
    print("\nDigite o Item a ser excluido: ")
    let itemExc = Int(readLine()!) ?? 0
    verItem(prods: prods, item: itemExc)
    print("\nDESEJA MESMO EXCLUIR O ITEM ACIMA? (1- SIM, 0-NAO): ")
    let opc = Int(readLine()!) ?? 0
    if(opc == 1){
        prods.remove(at: itemExc)
    }
}

var produtos = [produto]()


while(true){
    let opc = menu()
    if(opc.contains("0")){
        break;
    }

        switch opc {
    case "1":
        print("\nVER")
        ver(prods: produtos)
    case "2":
        print("\nA CRIAR\n")
        produtos.append(addProd())
    case "3":
        print("\nEXCLUIR")
        excluir(prods: &produtos)
    default:
        print("Default")  
}
}


