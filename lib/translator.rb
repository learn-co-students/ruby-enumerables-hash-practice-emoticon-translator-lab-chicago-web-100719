require "yaml"

def load_library(file)
  table = YAML.load_file(file)
  new_hash = {"get_meaning": {}, "get_emoticon": {}}
  
  table.each do |meaning, emoticons|
  new_hash[:get_meaning][emoticons[1]] = meaning
  new_hash[:get_emoticon][emoticons[0]] = emoticons[1]
  end
  
  new_hash
end

def get_japanese_emoticon(file, emoji)
  call = load_library(file)
  if call[:get_emoticon][emoji]
    call[:get_emoticon][emoji]
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoji)
  call = load_library(file)
  if call[:get_meaning][emoji]
    call[:get_meaning][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end