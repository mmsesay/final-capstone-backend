# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
    name: "User One",
    username: "user1",
    email: "user1@email.com"
)

User.create(
    name: "User Two",
    username: "user2",
    email: "user2@email.com"
)

User.create(
    name: "User Three",
    username: "user3",
    email: "user3@email.com"
)

Car.create(
    name: 'Honda C',
    description: 'Nice small car',
    price: 800,
    image: "https://tinyurl.com/yjvcmfkp",
    duration: 12,
    number_of_seats: 10
)

Car.create(
    name: 'Toyota Pro',
    description: 'Nice big car',
    price: 800,
    image: "https://tinyurl.com/yjvcmfkp",
    duration: 12,
    number_of_seats: 10
)

Car.create(
    name: 'Mazda xD14',
    description: 'Nice big car',
    price: 800,
    image: "https://tinyurl.com/yjvcmfkp",
    duration: 12,
    number_of_seats: 10
)

Car.create(
    name: 'Hybrid Ford',
    description: 'Nice big car',
    price: 800,
    image: "https://tinyurl.com/yjvcmfkp",
    duration: 12,
    number_of_seats: 10
)

Car.create(
    name: 'Mitsubishi Mars',
    description: 'Nice big car',
    price: 800,
    image: "https://tinyurl.com/yjvcmfkp",
    duration: 12,
    number_of_seats: 10
)

Car.create(
    name: 'Toyota X3',
    description: 'Nice big car',
    price: 800,
    image: "https://tinyurl.com/yjvcmfkp",
    duration: 12,
    number_of_seats: 10
)

10.times do 
    City.create(name:Faker::Address.city)
end

Reservation.create(
    user_id: 1,
    car_id: 1,
    city_id: 1,
    start_date: "2022-02-23",
    end_date: "2022-06-23"
)

Reservation.create(
    user_id: 2,
    car_id: 2,
    city_id: 2,
    start_date: "2022-02-23",
    end_date: "2022-06-23"
)

Reservation.create(
    user_id: 1,
    car_id: 1,
    city_id: 4,
    start_date: "2022-02-23",
    end_date: "2022-06-23"

)