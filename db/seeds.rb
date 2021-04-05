# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(name: "Tina", email: "tina@tina.com", password: "12345")
@admin = Admin.create(name: "Brittany", email: "brittany@brittany.com", password: "12345")
@appt = Appointment.create(location: "Zoom", comments: "First meeting", appt_datetime: " ", user_id: "1", admin_id: "1")
@tool = Toolkit.create(legal: "asdf", documents: "Asdf", job: "asdf", housing: "asdf", financial: "asdf", childcare: "Asdf", health: "ASdf", user_id: "1")