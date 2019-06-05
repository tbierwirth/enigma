require './lib/enigma'
enigma = Enigma.new

if ARGV.length != 3
    puts "Please give exactly three parameters."
    puts "Example: ruby ./lib/crack_it.rb encrypted.txt cracked.txt 040619"
    exit
end

encrypted = File.open(ARGV[0], &:readline)
cracked_message = enigma.crack(encrypted, ARGV[2])

cracked = File.open(ARGV[1], "w")
cracked.write(cracked_message[:decryption])

puts "Created '#{ARGV[1]}' with the cracked key #{cracked_message[:key]} and date #{cracked_message[:date]} after #{cracked_message[:attempts]} attempts"
cracked.close
