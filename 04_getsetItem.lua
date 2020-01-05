function constructor()
  system.setItem("fee", 10);
end

function getTestValue()
  return system.getItem("fee");
end

function setTestValue(value)
  system.setItem("fee", value);
end

abi.register(setTestValue)
abi.register_view(getTestValue)
