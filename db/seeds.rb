# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tkm = Book.create!(title: "To Kill a Mockingbird",
                   description: "The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it.",
                   publication_date: Time.new(1960),
                   available: true)

cap = Book.create!(title: "Crime and Punishment",
                   description: "Through the story of the brilliant but conflicted young Raskolnikov and the murder he commits, Fyodor Dostoevsky explores the theme of redemption through suffering.",
                   publication_date: Date.new(1866),
                   available: true)

omm = Book.create!(title: "Of Mice and Men",
                   description: "The compelling story of two outsiders striving to find their place in an unforgiving world.",
                   publication_date: Date.new(1937),
                   available: true)

hys = Book.create!(title: "One Hundred Years of Solitude",
                   description: "The novel tells the story of the rise and fall of the mythical town of Macondo through the history of the family.",
                   publication_date: Date.new(1967),
                   available: true)

sgr = Book.create!(title: "The Stranger",
                   description: "Through the story of an ordinary man unwittingly drawn into a senseless murder on an Algerian beach, Camus explored what he termed the nakedness of man faced with the absurd.",
                   publication_date: Date.new(1960),
                   available: true)

Book.create!(title: "Zorba The Greek",
             description: "TThe tale of a young Greek intellectual who ventures to escape his bookish life with the aid of the boisterous and mysterious Alexis Zorba.",
             publication_date: Date.new(1946))

Reservation.create!(book_id: tkm.id,
                    loan_date: Time.new(2016, 10, 21),
                    due_date: Time.new(2016, 11, 21),
                    return_date: Time.new(2016, 11, 15))

Reservation.create!(book_id: tkm.id,
                    loan_date: Time.new(2016, 11, 18),
                    due_date: Time.new(2016, 12, 18),
                    return_date: Time.new(2016, 11, 30))

Reservation.create!(book_id: tkm.id,
                    loan_date: Time.new(2016, 1, 11),
                    due_date: Time.new(2016, 3, 11),
                    return_date: Time.new(2016, 3, 8))

Reservation.create!(book_id: tkm.id,
                    loan_date: Time.new(2016, 11, 18),
                    due_date: Time.new(2016, 12, 18))

Reservation.create!(book_id: hys.id,
                    loan_date: Time.new(2016, 1, 11),
                    due_date: Time.new(2016, 3, 11),
                    return_date: Time.new(2016, 3, 8))

Reservation.create!(book_id: hys.id,
                    loan_date: Time.new(2016, 11, 18),
                    due_date: Time.new(2016, 12, 18),
                    return_date: Time.new(2016, 11, 30))

Reservation.create!(book_id: omm.id,
                    loan_date: Time.new(2016, 1, 11),
                    due_date: Time.new(2016, 3, 11),
                    return_date: Time.new(2016, 3, 8))

Reservation.create!(book_id: omm.id,
                    loan_date: Time.new(2016, 11, 18),
                    due_date: Time.new(2016, 12, 18),
                    return_date: Time.new(2016, 11, 30))

Reservation.create!(book_id: omm.id,
                    loan_date: Time.new(2016, 1, 11),
                    due_date: Time.new(2016, 3, 11),
                    return_date: Time.new(2016, 3, 8))

Reservation.create!(book_id: cap.id,
                    loan_date: Time.new(2016, 10, 21),
                    due_date: Time.new(2016, 11, 21),
                    return_date: Time.new(2016, 11, 21))

Reservation.create!(book_id: hys.id,
                    loan_date: Time.new(2016, 10, 21),
                    due_date: Time.new(2016, 11, 21))

Reservation.create!(book_id: sgr.id,
                    loan_date: Time.new(2016, 10, 21),
                    due_date: Time.new(2016, 11, 21))
