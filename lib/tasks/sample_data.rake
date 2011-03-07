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
end