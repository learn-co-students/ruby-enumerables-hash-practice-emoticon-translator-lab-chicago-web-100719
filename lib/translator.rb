require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  list = {}
  emoticons.each do |meaning,emojis|
    if !list[:get_meaning]
      list[:get_meaning] = {emojis[1] => meaning}
    else list[:get_meaning][emojis[1]] = meaning
    end
    
    if !list[:get_emoticon]
    list[:get_emoticon] = {emojis[0] =>emojis[1]}
    else list[:get_emoticon][emojis[0]]=emojis[1]
    end
  end
  list
end

def get_japanese_emoticon(path,emoji)
  list = load_library(path)
  if list[:get_emoticon][emoji]
    list[:get_emoticon][emoji]
  else p 'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(path,emoji)
  list = load_library(path)
  if list[:get_meaning][emoji]
    list[:get_meaning][emoji]
  else p "Sorry, that emoticon was not found"
  end
end