require "yaml"

def load_library(file)
  hash = YAML.load_file(file)
  new_hash = {"get_emoticon": {}, "get_meaning": {}}

  hash.each{|key, emoticon_array|
    new_hash[:get_meaning]["#{emoticon_array[1]}"] = key
    new_hash[:get_emoticon]["#{emoticon_array[0]}"] = "#{emoticon_array[1]}"
  }

  new_hash
end


def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  
  library[:get_emoticon].fetch(emoticon, "Sorry, that emoticon was not found")

end


def get_english_meaning(file, emoticon)
  library = load_library(file)
  
  library[:get_meaning].fetch(emoticon, "Sorry, that emoticon was not found")
end