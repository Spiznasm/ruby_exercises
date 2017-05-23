lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

stopwords = %w{the a by on for of are with just but and to the my I has some in}

#basic statistics
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/,'').length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length
sentence_per_paragraph = sentence_count/paragraph_count
words_per_sentence = word_count/sentence_count

#array of words
words = text.scan(/\w+/)
#next two are identical but with different methods
keywords = words.select {|word| !stopwords.include?(word)}
good_words = words.reject {|word| stopwords.include?(word)}

good_percentage = ((good_words.length.to_f / words.length.to_f)*100).to_i

#variables needed to produce a summary
#array of sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
#select sentences starting at 'one_third' index and pull 'one_third + 1' count
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
#only select those that contain is or are
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
#puts ideal_sentences.join(". ")

puts "#{line_count} lines."
puts "#{total_characters} characters."
puts "#{total_characters_nospaces} characters (excluding spaces)."
puts "#{word_count} words."
puts "#{sentence_count} sentences."
puts "#{paragraph_count} paragraphs."
puts "#{sentence_per_paragraph} sentences per paragraph (average)."
puts "#{words_per_sentence} words per sentence (average)."
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
