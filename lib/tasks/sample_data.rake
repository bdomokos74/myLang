# require 'faker'
# 
# namespace :db do
#   desc "Fill database with sample data"
#   task :populate => :environment do
#     Rake::Task['db:reset'].invoke
#     make_users
#   end
# end
# 
# def make_users
#   example1 = User.create!(:name => "example1",
#                        :uid => 1,
#                        :provider => "devel")
#   example2 = User.create!(:name => "example2",
#                        :uid => 2,
#                        :provider => "devel")
# 
# #  admin.toggle!(:admin)
#   10.times do |n|
#     name  = Faker::Name.name
#     User.create!(:name => name,
#                  :uid => (n+3),
#                  :provider => "devel")
#   end
# end