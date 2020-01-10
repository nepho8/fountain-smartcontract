local function extractNumbersInString(inputStr)
  local randomNumber = ""
  for str in string.gmatch(inputStr, '[0-9]') do
    randomNumber = randomNumber .. str
  end

  return tonumber(randomNumber)
end

local function isClear()
  local luckyNumber = extractNumbersInString(system.getPrevBlockHash()) + extractNumbersInString(system.getTimestamp()) + extractNumbersInString(system.getTxhash())
  local pickedNumber = tonumber(string.sub(luckyNumber, -2))

  if (pickedNumber == 0) then
    return true
  else
    return false
  end
end

function default()
  return isClear()
end

abi.payable(default)
