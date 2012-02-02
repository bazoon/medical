puts 'grands message:'
message = gets.chomp
if message == message.upcase
        puts 'not from ' + rand(1950) + ' !'
end
if message == message.downcase
        puts 'what speak louder!'
end
