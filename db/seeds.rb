# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

require "declarative_authorization/maintenance"

Authorization::Maintenance::without_access_control do

  puts 'Creating Roles'
  
  admin_role = Role.find_or_create_by_name :name => 'admin'
  guest_role = Role.find_or_create_by_name :name => 'guest'
  moderator_role = Role.find_or_create_by_name :name => 'moderator'
  author_role = Role.find_or_create_by_name :name => 'author'

  puts 'Creating Users'
  
  user = User.find_or_create_by_email :name => 'Admin User', :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'
  user.roles << admin_role unless user.roles.include? admin_role
  puts 'user: ' << user.name
  
  user = User.find_or_create_by_email :name => 'Guest User', :email => 'guest@example.com', :password => 'password', :password_confirmation => 'password'
  user.roles << guest_role unless user.roles.include? guest_role
  puts 'user: ' << user.name
  
  user = User.find_or_create_by_email :name => 'Moderator User', :email => 'moderator@example.com', :password => 'password', :password_confirmation => 'password'
  user.roles << moderator_role unless user.roles.include? moderator_role
  puts 'user: ' << user.name
  
  user = User.find_or_create_by_email :name => 'Author User', :email => 'author@example.com', :password => 'password', :password_confirmation => 'password'
  user.roles << author_role unless user.roles.include? author_role
  puts 'user: ' << user.name
  
  puts 'Creating Articles'
  
  article = Article.find_or_create_by_name :name => "The Piano, a Marvelous Instrument", :content => "The piano is a musical instrument played by means of a keyboard that produces sound by striking steel strings with felt hammers. The hammers immediately rebound allowing the strings to continue vibrating at their resonant frequency. These vibrations are transmitted through a bridge to a soundboard that amplifies them.", :author_name => "Chuck Bacon"
  article.comments << Comment.find_or_create_by_content(author_name: 'jason', content: 'hey, great article')
  puts 'article: ' << article.name
  
  article = Article.find_or_create_by_name :name => "What is Music", :content => "Music is an art form in which the medium is sound organized in time. Common elements of music are pitch (which governs melody and harmony), rhythm (and its associated concepts tempo, meter, and articulation), dynamics, and the sonic qualities of timbre and texture. The word derives from Greek (mousike), \"(art) of the Muses\".", :author_name => "Steve Black"
  article.comments << Comment.find_or_create_by_content(author_name: 'Laura', content: 'I love music')
  article.comments << Comment.find_or_create_by_content(author_name: 'Beth', content: 'Are you sure about that?')
  puts 'article: ' << article.name

  article = Article.find_or_create_by_name :name => "Many Musical Instruments", :content => "A musical instrument is a device constructed or modified for the purpose of making music. In principle, anything that produces sound can serve as a musical instrument. The term \"musical instrument\", however, is generally reserved for items that have a specific musical purpose such as a piano. The academic study of musical instruments is called organology.", :author_name => "Jacob Sanders"
  puts 'article: ' << article.name

end