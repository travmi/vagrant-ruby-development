module Destructable
  def destroy(anyobject)
    puts "I will destroy the object"
  end
end

class User
  # Need to include the module before it can be accessible by the Class.
  include Destructable
  attr_accessor :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end

  def run
    puts "I'm running"
  end

# Class method
  def self.identify_yourself
    puts "I'm a class method"
  end

end

class Buyer < User
  def run
    puts "Buyer class"
  end
end

class Seller < User
end

class Admin < User

end


user = User.new("Mike", "test@example.com")
puts "Username is #{user.name} email is #{user.email}"
puts user.name
user.name = "John"
user.email = "test1@example.com"
puts "User's new name is #{user.name} and email is #{user.email}"

buyer1 = Buyer.new("John Doe", "johndoe@example.com")
buyer1.run

seller1 = Seller.new("John Doe1", "johndoe1@example.com")
seller1.run

admin1 = Admin.new("John Doe2", "johndoe2@example.com")
admin1.run

puts Buyer.ancestors

# Can be called without initializing object
User.identify_yourself
