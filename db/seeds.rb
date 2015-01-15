# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
class Seed

  def initialize
    generate_artists
    puts "💥  Database has been successfully seeded 💥"
  end

  def generate_artists
    23.times do
      name  = %W(Outkast Muse StringCheeseIncident ColdWarKids JustinBeiber 311 Spongle Lotus Jay-Z MuteMath Adele Air alt-J AndrewBird TheBadPlus Bonobo Fischerspooner FourTet Goldpanda HundredWaters Moderat Papadosio STS9)
      month = %W(January February March April May June July)
      day   = %W(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31)
      time  = %W(9pm 10pm 8pm)
      venue = %W(Filmore Ogden Cervantes RedRocks)


      Artist.create!(
        name:           "#{name.sample}",
        date:           "#{month.sample}#{day.sample}",
        time:           "#{time.sample}",
        venue:          "#{venue.sample}"
        )
    end
  end

end

Seed.new
