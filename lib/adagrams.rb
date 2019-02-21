require "pry"
require "colorize"
@letter_hash = {A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2,
                N: 6,
                O: 8,
                P: 2,
                Q: 1,
                R: 6,
                S: 4,
                T: 6,
                U: 4,
                V: 2,
                W: 2,
                X: 1,
                Y: 2,
                Z: 1}
@points_hash = {A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10}

# @letter_array = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]
# @letter_hash.each do |letter, number|
#   number.times do
#     @letter_array.push(letter.to_s)
#   end
# end
# puts "#{@letter_array}"
# clone_array = @letter_array.clone

def draw_letters
  letter_array = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]
  # puts "-------------------------"

  new_hand = []
  10.times do
    letter = letter_array.sample
    new_hand.push(letter)
    letter_array.delete_at(letter_array.find_index(letter))
  end
  new_hand.each do |letter|
    letter_array.push(letter)
  end
  # puts new_hand
  return new_hand
end

# hand = draw_letters

def uses_available_letters?(input, letters_in_hand)
  input_array = input.upcase.split("").uniq
  input_array.each do |letter|
    if input.count(letter) > letters_in_hand.count(letter)
      return false
    end
  end
  return true
end

# puts uses_available_letters?("hello", draw_letters)

def score_word(word)
  points_hash = {A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10}
  points = 0
  word.each_char do |letter|
    # puts letter
    points += points_hash[letter.upcase.to_sym]
    # puts points_hash[letter.upcase.to_sym]
  end
  if word.length >= 7
    points += 8
  end
  return points
end

# puts "Total score: #{score_word("question")}"

def highest_score_from(words)
  # score_hash = Hash.new
  score_array = words.map do |word|
    {word: word, score: score_word(word)}
  end
  puts "Score array = #{score_array}"
  best_score = score_array.max_by do |word_hash|
    word_hash[:score]
  end
  puts "Best score = #{best_score}"
  best_scores = score_array.select do |score_hash|
    score_hash[:score] == best_score[:score]
  end
  puts "best scores = #{best_scores}"
  if best_scores.length == 1
    puts "best_scores.length = #{best_scores.length}"
    return best_scores[0]
  end
  #   ten_letter_word = best_scores.select do |score_hash|
  #     score_hash[:word].length == 10
  #   end
  #   return ten_letter_word[0]
  best_scores.each do |score_hash|
    return score_hash if score_hash[:word].length == 10
  end

  best_word = best_scores.min_by do |word_hash|
    word_hash[:word].length
  end
  return best_word
end
