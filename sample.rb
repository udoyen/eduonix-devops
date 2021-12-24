#!/usr/bin/env ruby
alpha ="AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz".split(//)
alpha2 ="?/\\|}{[]!@#$%^&*()_-+=<>,.`~'':;".split(//)
alpha3 ="1234567890".split(//)

password = ""
passwdlen = 15

puts %q{Generate new password, Yes or No?}

answer = gets.chomp

def pass_gen (pwd, pwdlen, alpha, alpha2, alpha3)
  while pwdlen > 0
    pwd += alpha.sample
    pwd += alpha2.sample
    pwd += alpha3.sample
    pwdlen -= 1
  end
  puts pwd
end

def ans_gen (ans)
  puts "I don't understand that input!"
  puts %q{Please enter a "yes", or "no"}
  ans = gets.chomp
end

if answer.downcase == "yes"
  pass_gen password, passwdlen, alpha, alpha2, alpha3
elsif answer.downcase == "no"
  puts "Run the script again to generate a new password!"
else
  puts %q{I don't understand that input!}
end
