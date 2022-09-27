class Alien < ActiveRecord::Base
   has_many :visitations
   has_many :earthlings, through: :visitations

   def visit (earthling)
      Visitation.create(
         date: DateTime.now,
         alien_id: self.id,
         earthling_id: earthling.id
      )
   end

   def total_light_years_traveled
      ( 2 * self.light_years_to_home_planet ) * self.visitations.count
   end

   def self.most_frequent_visitor
      Alien.all.max() {|a, b| a.visitations.count <=> b.visitations.count}
   end

   def self.average_light_years_to_home_planet
      Alien.average(:light_years_to_home_planet)
   end
end
