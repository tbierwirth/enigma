require './lib/enigma'
enigma = Enigma.new

encrypted = File.open(ARGV[0], &:readline)
decrypted_message = enigma.decrypt(encrypted, ARGV[2], ARGV[3])

decrypted = File.open(ARGV[1], "w")
decrypted.write(decrypted_message[:decryption])

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
decrypted.close
