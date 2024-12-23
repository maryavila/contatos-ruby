# Projeto: Gerenciador de Contatos Simples em Ruby
# Permite adicionar, listar e excluir contatos.

class GerenciadorContatos
  def initialize
    @contatos = []
  end

  def menu
    loop do
      puts "\n=== Gerenciador de Contatos ==="
      puts "1. Adicionar Contato"
      puts "2. Listar Contatos"
      puts "3. Remover Contato"
      puts "4. Sair"
      print "Escolha uma opção: "
      opcao = gets.chomp.to_i

      case opcao
      when 1
        adicionar_contato
      when 2
        listar_contatos
      when 3
        remover_contato
      when 4
        puts "Saindo... Até logo!"
        break
      else
        puts "Opção inválida. Tente novamente."
      end
    end
  end

  private

  def adicionar_contato
    print "Digite o nome do contato: "
    nome = gets.chomp
    print "Digite o telefone do contato: "
    telefone = gets.chomp
    @contatos << { nome: nome, telefone: telefone }
    puts "Contato adicionado com sucesso!"
  end

  def listar_contatos
    if @contatos.empty?
      puts "\nNenhum contato cadastrado."
    else
      puts "\n=== Lista de Contatos ==="
      @contatos.each_with_index do |contato, index|
        puts "#{index + 1}. Nome: #{contato[:nome]}, Telefone: #{contato[:telefone]}"
      end
    end
  end

  def remover_contato
    listar_contatos
    if @contatos.any?
      print "Digite o número do contato a ser removido: "
      indice = gets.chomp.to_i - 1
      if indice.between?(0, @contatos.size - 1)
        removido = @contatos.delete_at(indice)
        puts "Contato '#{removido[:nome]}' removido com sucesso!"
      else
        puts "Número inválido."
      end
    end
  end
end

# Inicializa o programa
GerenciadorContatos.new.menu
