state.var {
  TXId = state.value()
}

function default()
  TXId:set(system.getTxhash())
end

function getTXId()
  return TXId:get()
end

abi.payable(default)
abi.register_view(getTXId)
