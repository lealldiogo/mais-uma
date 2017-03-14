# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


gerente = Manager.new(email: "manager@example.com", password: "123456", first_name: "Jean", last_name: "Michel")
cliente = Customer.new(email: "customer@example.com", password: "123456", first_name: "Francois", last_name:"L'embrouille")
delivery_guy = DeliveryGuy.new(email:"delivery@example.com", password: "123456", first_name: "Juanito", last_name:"Escobar")
gerente.save!
cliente.save!

jogo2_data = DateTime.civil(2017, 03, 26, 16, 0, 0, 0)

jogo2 = Event.new(home_team: "Corinthians", away_team: "Vasco", location: "Arena Corinthians", photo: "mapa_arena_corinthians_edit_zx6m9u.png", datetime: jogo2_data)
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
delivery_guy.section = setor1
delivery_guy.save!

# setor = Section.new(name: "Norte")
# setor.event = jogo
# setor.save

cadeira = CustomerProfile.new(seat_info_1: "F27", seat_info_2: "132")
cadeira.customer = cliente
cadeira.section = setor1
cadeira.save!

refri = Product.new(name: "Refrigerante", price_centavos: "600", is_food: false, photo: "http://res.cloudinary.com/dr4xmxoal/image/upload/v1489452457/coke_1_nxujpi.png")
cerva = Product.new(name: "Cerveja", price_centavos: "700", is_food: false, photo: "http://res.cloudinary.com/dr4xmxoal/image/upload/v1489452457/beer_1_dppo27.png")
agua = Product.new(name: "Agua Mineral", price_centavos: "700", is_food: false, photo: "http://res.cloudinary.com/dr4xmxoal/image/upload/v1489452457/water_fene49.png")
burger = Product.new(name: "Hamburguer", price_centavos: "1500", is_food: true, photo: "http://res.cloudinary.com/dr4xmxoal/image/upload/v1489452457/hamburguer_cz6reh.png")
hotdog = Product.new(name: "Cachorro-Quente", price_centavos: "500", is_food: true, photo: "http://res.cloudinary.com/dr4xmxoal/image/upload/v1489452457/hot-dog_1_fym6n6.png")
pao = Product.new(name: "Bauru Bolado", price_centavos: "750", is_food: true, photo: "http://res.cloudinary.com/dr4xmxoal/image/upload/v1489452457/sandwich_jz0yor.png")
refri.save!
cerva.save!
agua.save!
burger.save!
hotdog.save!
pao.save!

bobsburger = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger.product = pao
bobsburger.section = setor1
bobsburger.save!

bobsburger = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger.product = agua
bobsburger.section = setor1
bobsburger.save!

bobsburger = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger.product = burger
bobsburger.section = setor1
bobsburger.save!


bobsrefri = ProductsStock.new(stand: "Bob's", quantity: 400)
bobsrefri.product = refri
bobsrefri.section = setor1
bobsrefri.save!

classicoscerva = ProductsStock.new(stand: "Clássicos", quantity: 470)
classicoscerva.product = cerva
classicoscerva.section = setor1
classicoscerva.save!

classicoshotdog = ProductsStock.new(stand: "Clássicos", quantity: 300)
classicoshotdog.product = hotdog
classicoshotdog.section = setor1
classicoshotdog.save!

entregue = Order.new(status: "Entregue")
feito = Order.new
entregue.customer_profile = cadeira
feito.customer_profile = cadeira
entregue.delivery_guy = delivery_guy
feito.delivery_guy = delivery_guy
entregue.save!
feito.save!

detalhesentregue1 = OrderDetail.new(quantity: 1)
detalhesentregue1.product = burger
detalhesentregue1.order = entregue
detalhesentregue1.save!

detalhesentregue2 = OrderDetail.new(quantity: 2)
detalhesentregue2.product = cerva
detalhesentregue2.order = entregue
detalhesentregue2.save!

detalhesfeito = OrderDetail.new(quantity: 4)
detalhesfeito.product = refri
detalhesfeito.order = feito
detalhesfeito.save!
