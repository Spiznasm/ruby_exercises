def substrings(sentence,dictionary)
  results = Hash.new(0)
  sentence.scan(/[A-Za-z]+/).each do |word|
    if dictionary.include? word.downcase
      results[word.downcase]+=1
    end
  end
  return results
end
