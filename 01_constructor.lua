state.var {
  TestValue = state.value()
}

function constructor()
  TestValue:set(100)
end

function getTestValue()
  return TestValue:get()
end

abi.register_view(getTestValue)
