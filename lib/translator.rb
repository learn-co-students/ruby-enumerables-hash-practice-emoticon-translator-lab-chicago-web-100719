require "yaml"
require "pry"

def load_library (file_path)
  translator = YAML.load_file(file_path)
  new_translator = {}
  translator.each do |emotion, emoticons|
    if new_translator["get_meaning"]
      new_translator["get_meaning"][emoticons[1]] = emotion
      new_translator["get_emoticon"][emoticons[0]] = emoticons[1]
    else  
      new_translator["get_meaning"]= {emoticons[1] => emotion}
      new_translator["get_emoticon"] = {emoticons[0] => emoticons[1]}
    end
  end
  return new_translator
end

def get_japanese_emoticon (file_path, west_emot)
  new_translator = load_library (file_path)
  if new_translator["get_emoticon"][west_emot]
    return new_translator["get_emoticon"][west_emot]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (file_path, jap_emot)
  new_translator = load_library (file_path)
  if new_translator["get_meaning"][jap_emot]
    return new_translator["get_meaning"][jap_emot]
  else
    return "Sorry, that emoticon was not found"
  end
end
