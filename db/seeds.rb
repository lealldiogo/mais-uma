# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ProductsStock.destroy_all
# CustomerProfile.destroy_all
# # Section.destroy_all
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

jogo2 = Event.new(home_team: "Corinthians", away_team: "Vasco", location: "Arena Corinthians", photo: "dljt3xe0k6fistk8xsf4.jpg")
jogo2.manager = gerente
jogo2.save!

setor1 = Section.new(name: "Norte N4")

setor2 = Section.new(name: "Sul N4")
setor3 = Section.new(name: "Leste N4")
setor4 = Section.new(name: "Oeste N4")
setor5 = Section.new(name: "Leste N6")
setor6 = Section.new(name: "Oeste N9")
setor7 = Section.new(name: "Visitante")
setor8 = Section.new(name: "Oeste VIP N4")


setor1.event = jogo2
setor2.event = jogo2
setor3.event = jogo2
setor4.event = jogo2
setor5.event = jogo2
setor6.event = jogo2
setor7.event = jogo2
setor8.event = jogo2
setor1.save!
setor2.save!
setor3.save!
setor4.save!
setor5.save!
setor6.save!
setor7.save!
setor8.save!

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
bobsburger.section = setor1
bobsburger.save

bobsrefri = ProductsStock.new(stand: "Bob's", quantity: 400)
bobsrefri.product = refri
bobsrefri.section = setor1
bobsrefri.save

classicoscerva = ProductsStock.new(stand: "Clássicos", quantity: 470)
classicoscerva.product = cerva
classicoscerva.section = setor1
classicoscerva.save

classicoshotdog = ProductsStock.new(stand: "Clássicos", quantity: 300)
classicoshotdog.product = hotdog
classicoshotdog.section = setor1
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
