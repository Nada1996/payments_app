# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sales_dep = Departement.create(name:'sales',salary_day:30,bonus_day:15, bonus_percentage:10)

staff1 = Staff.create(name:'Nada',bonus_percentage: 12,salary:8000, departement_id: sales_dep.id)
staff2 = Staff.create(name:'sam',bonus_percentage: 10,salary:5000, departement_id: sales_dep.id)
staff3 = Staff.create(name:'Dan',bonus_percentage: 8,salary:4000, departement_id: sales_dep.id)


sales_dep = Departement.last
puts(sales_dep.name)
months = Date::ABBR_MONTHNAMES

for month in months[1..-1] 
    puts(month)
    bonus_total = Staff.where(departement_id:sales_dep.id).sum("bonus_percentage * salary/100")
    salaries_total = Staff.where(departement_id:sales_dep.id).sum("salary")
    payments_total = salaries_total + bonus_total
    sales_dep.payments.create(month:month,year:2019,bonus_total:bonus_total,salaries_total:salaries_total,payments_total:payments_total)
end    


