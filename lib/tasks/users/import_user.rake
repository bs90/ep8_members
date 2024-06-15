# frozen_string_literal: true

require "csv"

namespace :users do
  task import_user: :environment do
    puts "Running users:import_user"

    file = File.read Rails.root.join("lib/tasks/users/import_user.csv")
    datas = CSV.parse(file, headers: true)

    datas.each do |i|
      # binding.pry
      User.create!(email: i[1], role: i[2], provider: i[3])
    end
  end
end
