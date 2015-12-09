user_permissions_template.json:
{"accounts": "read",
"policies": "write",
"users": "write"}

user.rb:
require 'json'

class User
  attr_accessor :email, :name, :permissions
  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template
end

def self.permissions_from_template
  file = File.read 'user_permissions_template.json'
  JSON.load(file, nil, symbolize_names: true)
end

def save
  self_json = {email: @email, name: @name, permissions: @permissions}.to_json
    open('users.json', 'a') do |file|
    file.puts self_json
    end
  end
end

runner.rb:
require 'pp'
require_relative 'user'

user = User.new 'joe@example.com', 'joe'
pp user
user.save
