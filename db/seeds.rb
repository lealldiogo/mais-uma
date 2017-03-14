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

jogo2 = Event.new(home_team: "Corinthians", away_team: "Vasco", location: "Arena Corinthians",
                  photo: "mapa_arena_corinthians_edit_zx6m9u.png", datetime: jogo2_data,
                  home_team_logo: "corinthians-hd-logo_gwyl6m.png", away_team_logo: "vasco_yi6nxn.png" )


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

# INICIO JOGO 3

gerente_a = Manager.new(email: "manager2@example.com", password: "123456", first_name: "Walter", last_name: "Montijo")
cliente_a = Customer.new(email: "customer2@example.com", password: "123456", first_name: "Clarence", last_name:"Seedorf")
delivery_guy_a = DeliveryGuy.new(email:"delivery2@example.com", password: "123456", first_name: "Tulio", last_name:"Maravilha")
gerente_a.save!
cliente_a.save!



 jogo3_data = DateTime.civil(2017, 04, 07, 16, 0, 0, 0)

 jogo3 = Event.new(home_team: "Corinthians", away_team: "Cruzeiro", location: "Arena Corinthians",
  photo: "mapa_arena_corinthians_edit_zx6m9u.png", datetime: jogo3_data,
  home_team_logo: "corinthians-hd-logo_gwyl6m.png", away_team_logo: "cruzeiro-hd-logo_voqedg.png")

 jogo3.manager = gerente
 jogo3.save!

 setor1a = Section.new(name: "Norte N4")
 setor2a = Section.new(name: "Sul N4")
 setor3a = Section.new(name: "Leste N4")
 setor4a = Section.new(name: "Oeste N4")
 setor5a = Section.new(name: "Leste N6")
 setor6a = Section.new(name: "Oeste N9")
 setor7a = Section.new(name: "Visitante")
 setor8a = Section.new(name: "Oeste VIP N4")


 setor1a.event = jogo3
 setor2a.event = jogo3
 setor3a.event = jogo3
 setor4a.event = jogo3
 setor5a.event = jogo3
 setor6a.event = jogo3
 setor7a.event = jogo3
 setor8a.event = jogo3
 setor1a.save!
 setor2a.save!
 setor3a.save!
 setor4a.save!
 setor5a.save!
 setor6a.save!
 setor7a.save!
 setor8a.save!
 delivery_guy_a.section = setor1a
 delivery_guy_a.save!


# FINAL JOGO 3

# INICIO JOGO 4

gerente_b = Manager.new(email: "manager3@example.com", password: "123456", first_name: "Sebastian", last_name: "Abreu")
cliente_b = Customer.new(email: "customer3@example.com", password: "123456", first_name: "Joel", last_name:"Carli")
delivery_guy_b = DeliveryGuy.new(email:"delivery3@example.com", password: "123456", first_name: "Leandro" , last_name: "Avila")
gerente_b.save!
cliente_b.save!


jogo4_data = DateTime.civil(2017, 04, 07, 16, 0, 0, 0)

jogo4 = Event.new(home_team: "Gremio", away_team: "Internacional", location: "Arena do Grêmio",
 photo: "arena_gremio_setores_lux5si.jpg", datetime: jogo4_data,
 home_team_logo: "gremio-hd-logo_utku6m.png", away_team_logo: "internacional-hd-logo_evnj3r.png")

jogo4.manager = gerente
jogo4.save!

setor1b = Section.new(name: "Alta L / SE / NE")
setor2b = Section.new(name: "Alta O / NW / SW")
setor3b = Section.new(name: "Alta N")
setor4b = Section.new(name: "Alta S")
setor5b = Section.new(name: "Gramado L / SE / NE")
setor6b = Section.new(name: "Gramado O / NW / SW")
setor7b = Section.new(name: "Gramado N")
setor8b = Section.new(name: "Gramado S")


setor1b.event = jogo4
setor2b.event = jogo4
setor3b.event = jogo4
setor4b.event = jogo4
setor5b.event = jogo4
setor6b.event = jogo4
setor7b.event = jogo4
setor8b.event = jogo4
setor1b.save!
setor2b.save!
setor3b.save!
setor4b.save!
setor5b.save!
setor6b.save!
setor7b.save!
setor8b.save!
delivery_guy_b.section = setor1b
delivery_guy_b.save!



# FINAL JOGO 4



# cadeira = CustomerProfile.new(seat_info_1: "F27", seat_info_2: "132")
# cadeira.customer = cliente
# cadeira.section = setor1
# cadeira.save!

refri = Product.new(name: "Refrigerante", price_centavos: "600", is_food: false, photo: "Cocaapp_nicllq.png")
cerva = Product.new(name: "Cerveja", price_centavos: "700", is_food: false, photo: "Beerapp_ihiv82.png")
agua = Product.new(name: "Agua Mineral", price_centavos: "700", is_food: false, photo: "water_btiwsy.png")
burger = Product.new(name: "Hamburguer", price_centavos: "1500", is_food: true, photo: "Burger_va3z3l.png")
hotdog = Product.new(name: "Cachorro-Quente", price_centavos: "500", is_food: true, photo: "Hotdogapp_pptrxo.png")
pizza = Product.new(name: "Pizza", price_centavos: "750", is_food: true, photo: "Pizzaapp_r5uyoo.png")
refri.save!
cerva.save!
agua.save!
burger.save!
hotdog.save!
pizza.save!

#jogo2

bobsburger = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger.product = pizza
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


# JOGO3

bobsburger3 = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger3.product = pizza
bobsburger3.section = setor1a
bobsburger3.save!

bobsburger3 = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger3.product = agua
bobsburger3.section = setor1a
bobsburger3.save!

bobsburger3 = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger3.product = burger
bobsburger3.section = setor1a
bobsburger3.save!


bobsrefri3 = ProductsStock.new(stand: "Bob's", quantity: 400)
bobsrefri3.product = refri
bobsrefri3.section = setor1a
bobsrefri3.save!

classicoscerva3 = ProductsStock.new(stand: "Clássicos", quantity: 470)
classicoscerva3.product = cerva
classicoscerva3.section = setor1a
classicoscerva3.save!

classicoshotdog3 = ProductsStock.new(stand: "Clássicos", quantity: 300)
classicoshotdog3.product = hotdog
classicoshotdog3.section = setor1a
classicoshotdog3.save!


#final jogo 3

#inicio jogo4

bobsburger4 = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger4.product = pizza
bobsburger4.section = setor1b
bobsburger4.save!

bobsburger4 = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger4.product = agua
bobsburger4.section = setor1b
bobsburger4.save!

bobsburger4 = ProductsStock.new(stand: "Bob's", quantity: 230)
bobsburger4.product = burger
bobsburger4.section = setor1b
bobsburger4.save!


bobsrefri4 = ProductsStock.new(stand: "Bob's", quantity: 400)
bobsrefri4.product = refri
bobsrefri4.section = setor1b
bobsrefri4.save!

classicoscerva4 = ProductsStock.new(stand: "Clássicos", quantity: 470)
classicoscerva4.product = cerva
classicoscerva4.section = setor1b
classicoscerva4.save!

classicoshotdog4 = ProductsStock.new(stand: "Clássicos", quantity: 300)
classicoshotdog4.product = hotdog
classicoshotdog4.section = setor1b
classicoshotdog4.save!


# entregue = Order.new(status: "Entregue")
# feito = Order.new
# entregue.customer_profile = cadeira
# feito.customer_profile = cadeira
# entregue.delivery_guy = delivery_guy
# feito.delivery_guy = delivery_guy
# entregue.save!
# feito.save!

# detalhesentregue1 = OrderDetail.new(quantity: 1)
# detalhesentregue1.product = burger
# detalhesentregue1.order = entregue
# detalhesentregue1.save!

# detalhesentregue2 = OrderDetail.new(quantity: 2)
# detalhesentregue2.product = cerva
# detalhesentregue2.order = entregue
# detalhesentregue2.save!

# detalhesfeito = OrderDetail.new(quantity: 4)
# detalhesfeito.product = refri
# detalhesfeito.order = feito
# detalhesfeito.save!
