unless User.exists?(email: 'admin@ticket_sponge.com')
  User.create!(email: 'admin@ticket_sponge.com', password: 'password', admin: true)
end

unless User.exists?(email: 'viewer@ticket_sponge.com')
  User.create!(email: 'viewer@ticket_sponge.com', password: 'password')
end

['Atom.io', 'Internet Explorer'].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A sample project about #{name}")
  end
end
