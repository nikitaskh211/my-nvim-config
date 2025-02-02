-- Discord rich presence
return {
  "IogaMaster/neocord",
  event = "VeryLazy",
  config = function()
    require("neocord").setup()
  end
}
