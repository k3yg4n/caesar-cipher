def caesar_cipher(string, shiftVal)
  decodedString = ""
  firstCap = "A".bytes.join("").to_i
  lastCap = "Z".bytes.join("").to_i
  firstLow = "a".bytes.join("").to_i
  lastLow = "z".bytes.join("").to_i

  if(shiftVal == 26 || shiftVal == -26) #Return string if shift is 26 (does not change)
    return string 
  end

  while (shiftVal > 26)
    shiftVal -= 26
  end

  while (shiftVal < -26)
    shiftVal += 26
  end

  string.each_byte do |currChar|
    shiftedNum = currChar + shiftVal
    currCharString = currChar.chr

    if(currChar.between?(firstCap, lastCap) == false && currChar.between?(firstLow,lastLow) == false) # If it is not a valid letter, append it as is
      decodedString += currCharString
      next
    end

    if(shiftedNum > lastLow) # if gone past 'z'
      while(shiftedNum > lastLow)
        shiftedNum -= 26
      end
    elsif(isUppercase(currCharString) == false && shiftedNum < firstLow && shiftedNum > lastCap) #if gone past 'a'
      while(shiftedNum < firstLow)
        shiftedNum += 26
      end
    elsif(isUppercase(currCharString) && shiftedNum > lastCap && shiftedNum < firstLow) # if gone past 'Z'
      while(shiftedNum > lastCap)
        shiftedNum -= 26
      end
    elsif(shiftedNum < firstCap) #if gone past 'A'
      while(shiftedNum < firstCap)
        shiftedNum += 26
      end
    end

    decodedString += shiftedNum.chr
  
  end

  return decodedString
end

def isUppercase(char)
  return char == char.upcase
end

p caesar_cipher("abcdefghijklmnopqrstuvwxyz",2)
p caesar_cipher("abcdefghijklmnopqrstuvwxyz".upcase,-2)