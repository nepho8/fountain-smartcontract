state.var {
  GIdx = state.value(),
  GEntIdx = state.value(),
  GAmount = state.value(),
  FeeAddress = state.value(),
  FeePercent = state.value(),
  WinnerNumber = state.value(),
  GameRule = state.map()
}

function constructor()
  GIdx:set(1)
  GEntIdx:set(1)
  GAmount:set("1000000000000000000")
  FeeAddress:set("AmNQH1rBTwHx6E831NsCLrDN953krzob6FKyLQ12qumXAzFVGo4o")
  FeePercent:set(10)
  WinnerNumber:set(500)
  GameRule["GIdx"] = 1
  GameRule["GEntIdx"] = 1
end

function default()
  chkLimitAmount()

  local isWinner = progressGame()

  if isWinner then
    return nextGame()
  else
    return "Failed."
  end
end

function chkLimitAmount()
  assert(system.getAmount() == tostring(GAmount:get()), "Your amount was " .. system.getAmount() .. ". Only " .. tostring(GAmount:get()) .. " AER can participate.")
end

function progressGame()
  GEntIdx:set(GEntIdx:get() + 1)

  local feeAmount = system.getAmount() * FeePercent:get() / 100
  contract.send(FeeAddress:get(), bignum.number(feeAmount))

  local luckyNumber = extractNumbersInString(system.getPrevBlockHash()) + extractNumbersInString(system.getTimestamp()) + extractNumbersInString(system.getTxhash())
  local pickedNumber = tonumber(string.sub(luckyNumber, -4))

  if (pickedNumber <= WinnerNumber:get()) then
    return true
  else
    return false
  end
end

function nextGame()
  GIdx:set(GIdx:get() + 1)
  GameRule["GIdx"] = 1
  contract.send(system.getSender(), contract.balance())
  return "Congratulations."
end

function extractNumbersInString(inputStr)
  local randomNumber = ""
  for str in string.gmatch(inputStr, '[0-9]') do
    randomNumber = randomNumber .. str
  end
  return tonumber(randomNumber)
end

function getInfo()
  return GIdx:get(), GEntIdx:get(), FeeAddress:get(), FeePercent:get()
end

abi.payable(default)
abi.register_view(getInfo)
