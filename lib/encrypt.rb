require './lib/enigma'
enigma = Enigma.new

message = File.open(ARGV[0], &:readline)
message.delete!("\n")

encrypted_message = enigma.encrypt(message)

encrypted.close
