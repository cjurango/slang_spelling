desc 'Imports the words into the ActiveRecord Word table'
task import_words: [:environment] do
  require 'open-uri'
  begin
    words_url = 'https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt'
    open(words_url) do |f|
      f.each_line do |line|
        line.strip!
        if line.length > 1
          pool = line.split(//)
          Word.create complete_word: line, letter_pool: pool
        end
      end
    end
  rescue OpenURI::HTTPError
    puts 'Missing words file'
  end
end
