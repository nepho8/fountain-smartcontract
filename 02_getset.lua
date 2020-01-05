state.var {
  TestValue = state.value()
}

function constructor()
  TestValue:set(100)
end

function getTestValue()
  return TestValue:get()
end

function setTestValue(value)
  TestValue:set(value)
end

abi.register(setTestValue)
abi.register_view(getTestValue)
