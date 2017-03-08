# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ProductsStock.destroy_all
# CustomerProfile.destroy_all
# Section.destroy_all
# Event.destroy_all
# OrderDetail.destroy_all
# Order.destroy_all
# Product.destroy_all
# User.destroy_all

gerente = Manager.new(email: "manager@example.com", password: "123456")
cliente = Customer.new(email: "customer@example.com", password: "123456")
gerente.save
cliente.save

jogo = Event.new(home_team: "Náutico", away_team: "Vasco")
jogo.manager = gerente
jogo.save

setor = Section.new(name: "Norte")
setor.event = jogo
setor.save

cadeira = CustomerProfile.new(seat_info_1: "F27", seat_info_2: "132")
cadeira.customer = cliente
cadeira.section = setor
cadeira.save

refri = Product.new(name: "Refrigerante", price: "6.00", is_food: false)
cerva = Product.new(name: "Cerveja", price: "7.00", is_food: false)
burger = Product.new(name: "Hamburguer", price: "15.00", is_food: true)
hotdog = Product.new(name: "Cachorro-Quente", price: "10.00", is_food: true)
refri.save
cerva.save
burger.save
hotdog.save

bobsburger = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger.product = burger
bobsburger.section = setor
bobsburger.save

bobsrefri = ProductsStock.new(stand: "Bob's", quantity: 400)
bobsrefri.product = refri
bobsrefri.section = setor
bobsrefri.save

classicoscerva = ProductsStock.new(stand: "Clássicos", quantity: 470)
classicoscerva.product = cerva
classicoscerva.section = setor
classicoscerva.save

classicoshotdog = ProductsStock.new(stand: "Clássicos", quantity: 300)
classicoshotdog.product = hotdog
classicoshotdog.section = setor
classicoshotdog.save

entregue = Order.new(status: "Entregue")
feito = Order.new
entregue.customer_profile = cadeira
feito.customer_profile = cadeira
entregue.save
feito.save

detalhesentregue1 = OrderDetail.new(quantity: 1)
detalhesentregue1.product = burger
detalhesentregue1.order = entregue
detalhesentregue1.save

detalhesentregue2 = OrderDetail.new(quantity: 2)
detalhesentregue2.product = cerva
detalhesentregue2.order = entregue
detalhesentregue2.save

detalhesfeito = OrderDetail.new(quantity: 4)
detalhesfeito.product = refri
detalhesfeito.order = feito
detalhesfeito.save
