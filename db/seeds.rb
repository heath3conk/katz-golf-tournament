additional_donation_possibilities = [0,25, 50, 100]
8.times do
  Signup.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company_name: Faker::Company.name,
    email: Faker::Internet.email,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code,
    contact_number: Faker::PhoneNumber.phone_number,
    additional_donation: additional_donation_possibilities.sample,
    )
end

signup_counter = 1
3.times do
  4.times do
    Player.create!(
      signup_id: signup_counter,
      player_first_name: Faker::Name.first_name,
      player_last_name: Faker::Name.last_name
      )
  end
  signup_counter += 1
end

2.times do
  Diner.create!(
    signup_id: 4,
    diner_first_name: Faker::Name.first_name,
    diner_last_name: Faker::Name.last_name
    )
end

sponsorship_counter = 5
10.times do
  Sponsorship.create!(
    signup_id: sponsorship_counter,
    buffet: rand(0..1),
    beverage_cart: rand(0..1),
    at_the_turn: rand(0..1),
    closest_to_pin: rand(0..1),
    longest_drive: rand(0..1),
    tee_box: rand(0..5)
    )
  sponsorship_counter += 1
end

User.create!(
  username: "katzgolf",
  password: "password",
  email: "cs6575@att.com",
  role: "boss"
  )