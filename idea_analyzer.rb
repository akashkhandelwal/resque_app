require "resque"
require_relative "word_analyzer"

idea = ARGV
puts "Analyzing your idea: #{idea.join(" ")}"
idea.each do |word|
	puts "Asking for job to analyze #{word}"
	Resque.enqueue(WordAnalyzer, word)
end