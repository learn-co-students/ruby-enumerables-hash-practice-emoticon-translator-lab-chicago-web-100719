require "yaml"

def load_library(file_path)
  new_hash = {}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |meaning, emo_pair|

    if !new_hash[:get_meaning]
      new_hash[:get_meaning] = { emo_pair[1] => meaning }
    else
      new_hash[:get_meaning][emo_pair[1]] = meaning
    end

    if !new_hash[:get_emoticon]
      new_hash[:get_emoticon] = { emo_pair[0] => emo_pair[1] }
    else
      new_hash[:get_emoticon][emo_pair[0]] = emo_pair[1]
    end

  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)

  if emoticons[:get_emoticon][emoticon]
    return emoticons[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end

end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)

  if emoticons[:get_meaning][emoticon]
    return emoticons[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end
