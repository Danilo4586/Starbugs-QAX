Quando('acesso a página principal da Stabugs') do
    visit 'https://starbugs.vercel.app/'
    sleep 5
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    products = all('.coffee-item')
    puts "Quantidade de cafés encontrados: #{products.size}"
    expect(products.size).to be > 0, "A lista de cafés está vazia, deveria ter ao menos um café."

end