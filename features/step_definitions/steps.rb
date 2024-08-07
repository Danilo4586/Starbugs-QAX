Quando('acesso a página principal da Stabugs') do
    visit 'https://starbugs.vercel.app/'
    sleep 5
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    products = all('.coffee-item')
    puts "Quantidade de cafés encontrados: #{products.size}"
    expect(products.size).to be > 0, "A lista de cafés está vazia, deveria ter ao menos um café."

end

Dado('que estou na página principal da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end

Dado('que deseja comprar o café {string}') do |product_name|
    @product_name = product_name 
end

Dado('que esse produto custa {string}') do |product_price|
    @product_price = product_price
end

Dado('que o custo de entrega é de {string}') do |delivery_price|
    @delivery_price = delivery_price
end

Quando('inicio a compra desse item') do
    product = find('.coffee-item', text: @product_name)
    product.find('.buy-coffee').click
    sleep 10
end

Então('devo ver a página de checkout com os detalhes do produto') do
    product_title = find('.item-details h1')
    expect(product_title.text).to eql @product_name

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql @product_price

    delivery = find('.delivery .delivery-price')
    expect(delivery.text).to eql @delivery_price
end

Então('o valor total da compra deve ser de {string}') do |total_price|
    @total_price = total_price
    total_price = find('.total .total-price')
    expect(total_price.text).to eql @total_price
end

Dado('que estou na página principal da starbugs') do
    pending # Write code here that turns the phrase above into concrete actions
end

Dado('que desejo comprar o café {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

Então('devo ver um popup informando que o produto está indisponível') do
    pending # Write code here that turns the phrase above into concrete actions
end