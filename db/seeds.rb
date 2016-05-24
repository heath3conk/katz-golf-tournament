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

3.times do
  signup_counter = 1
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

sponsorship_options = ["buffet", "bev_cart", "snack", "closest_to_pin", "longest_drive", "tee_box_sign", "tee_box_1", "tee_box_2", "tee_box_3", "tee_box_4"]

10.times do
  Sponsorship.create!(
    signup_id: rand(5..8),
    sponsorship_type: sponsorship_options.sample
    )
end

User.create!(
  username: "katzgolf",
  password: "password",
  email: "cs6575@att.com",
  role: "boss"
  )