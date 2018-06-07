require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  all_toys = kid_data_array[2..7]
  toys     = kid_data_array[2..6]
  last_toy = kid_data_array[7]

  if all_toys.include?('Kaleidoscope')
    all_toys.delete('Kaleidoscope')
  end

  all_toys= toys.sample







  infraction = kid_data_array[14..-1]

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
