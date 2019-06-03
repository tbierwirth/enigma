require './lib/enigma'
enigma = Enigma.new

message = File.open(ARGV[0], &:readline)
message.delete!("\n")

encrypted_message = enigma.encrypt(message)

encrypted = File.open(ARGV[1], "w")
encrypted.write(encrypted_message[:encryption])

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
encrypted.close
