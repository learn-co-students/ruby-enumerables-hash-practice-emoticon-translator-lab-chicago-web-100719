# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticon_hash = {}
  emoticons = YAML.load_file(file_path)
  
  emoticon_hash['get_meaning'] = {}
  emoticon_hash['get_emoticon'] = {}
  
  emoticons.each do |word, emoticon_set|
  emoticon_hash['get_emoticon'][emoticon_set.first] = emoticon_set.last 
  emoticon_hash['get_meaning'][emoticon_set.last] = word
end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  japanese = emoticon_hash['get_emoticon'][emoticon]
  if japanese
    return japanese
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  meaning = emoticon_hash['get_meaning'][emoticon]
  if meaning
    return meaning
  else
    return "Sorry, that emoticon was not found"
  end
end