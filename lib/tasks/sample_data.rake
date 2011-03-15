# encoding: utf-8
require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
  end
end

def make_users  
  example1 = User.create_with_omniauth(
      "user_info" => {"name" =>"example1"},
      "uid" => 1,
      "provider" => "devel")
  example1.items.create!(:expression => "tomorrow", :translation => "mañana")
  example1.items.create!(:expression => "today", :translation => "hoy")
  example1.items.create!(:expression => "monday", :translation => "el lunes")
  example1.items.create!(:expression => "tuesday", :translation => "el martes")
  example1.items.create!(:expression => "wednesday", :translation => "el miércoles")
  example1.items.create!(:expression => "thursday", :translation => "el jueves")
  example1.items.create!(:expression => "friday", :translation => "el viernes")
  example1.items.create!(:expression => "saturday", :translation => "el sabados")
  example1.items.create!(:expression => "sunday", :translation => "el domingos")
  example1.items.create!(:expression => "one", :translation => "uno, una")
  example1.items.create!(:expression => "two", :translation => "dos")
  example1.items.create!(:expression => "three", :translation => "tres")
  example1.items.create!(:expression => "four", :translation => "cuatro")
  example1.items.create!(:expression => "five", :translation => "cinco")
  example1.items.create!(:expression => "six", :translation => "seis")
  example1.items.create!(:expression => "seven", :translation => "siete")
  example1.items.create!(:expression => "eight", :translation => "ocho")
  example1.items.create!(:expression => "nine", :translation => "nueve")
  example1.items.create!(:expression => "ten", :translation => "diez")
  example1.items.create!(:expression => "eleven", :translation => "once")
  example1.items.create!(:expression => "twelwe", :translation => "doce")
  
  example2 = User.create_with_omniauth(
    "user_info" => {"name" =>"example2"},
    "uid" => 2,
    "provider" => "devel")
  example2.items.create!(:expression => "behind", :translation => "detrás de")
  example2.items.create!(:expression => "in front of", :translation => "delante de")
end