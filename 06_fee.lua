state.var {
  FeePercent = state.value()
}

function constructor()
  FeePercent:set(10)
end

function default()
  local amount = system.getAmount()
  local feeAmount = amount * FeePercent:get() / 100

  contract.send("AmNQH1rBTwHx6E831NsCLrDN953krzob6FKyLQ12qumXAzFVGo4o", bignum.number(amount-feeAmount))
  contract.send("AmMdqDaizbsUFoaYrBTkdYADPDWUxsfZsUFyzLcMgPc9ywtPfccm", bignum.number(feeAmount))
end

abi.payable(default)
