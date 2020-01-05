function default()
  local limitAmount = "1000000000000000000"
  local amount = system.getAmount()

  checkAmount(amount, limitAmount)
end

function checkAmount(amount, limitAmount)
  local checked = (amount == limitAmount)
  assert(checked, "Your amount was " .. amount .. ". Only " .. limitAmount .. " AER can participate.")
end

abi.payable(default)
