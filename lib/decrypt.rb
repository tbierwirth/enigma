require './lib/enigma'
enigma = Enigma.new

encrypted = File.open(ARGV[0], &:readline)
decrypted_message = enigma.decrypt(encrypted, ARGV[2], ARGV[3])

decrypted.close
