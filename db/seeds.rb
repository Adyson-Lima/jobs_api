puts 'Gerando jobs...'

5.times do |i|
  Job.create(
    name: ["dev rails", "dev java", "dev python"].sample ,
    wage: "salário da categoria"
    )
end

puts 'jobs gerados com sucesso!'