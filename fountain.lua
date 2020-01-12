state.var {
  GData = state.map(),
  GIdx = state.value(),
  GEntIdx = state.value(),
  GAmount = state.value()
}

function constructor()
  GameIdx:set(1)
  GameEntIdx:set(1)
  GAmount:set(1 * 1000000000000000000)
end

function default()
  assert(system.getAmount() == GAmount:get(), "Your amount was " .. system.getAmount() .. ". Only " .. GAmount:get() .. " AER can participate.")

  GData[GIdx:get()][GEntIdx:get()] = {
    sender = system.getSender(),
    amount = system.getAmount(),
    txid = system.getTxhash()
  }

  GEntIdx:set(GEntIdx:get() + 1)
  
end
