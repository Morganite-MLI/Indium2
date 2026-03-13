local util = require("__bzlib__/data-util")

local indium_processing_effects ={
  {
    type = "unlock-recipe",
    recipe = "indium-plate",
  },
  {
    type = "unlock-recipe",
    recipe = "indium-solder",
  },
  {
    type = "unlock-recipe",
    recipe = "cryogenic-seal",
  }
}
if mods["BrassTacks-Updated"] and data.raw.item["airtight-seal"] then
indium_processing_effects ={
  {
    type = "unlock-recipe",
    recipe = "indium-plate",
  },
  {
    type = "unlock-recipe",
    recipe = "indium-solder",
  },
  {
    type = "unlock-recipe",
    recipe = "cryogenic-seal",
  },
  {
    type = "unlock-recipe",
    recipe = "indium-airtight-seal",
  }
}
end
data:extend(
  {
    {
      type = "technology",
      name = "indium-processing",
      icons =
      {
        { icon = "__Indium2__/graphics/icons/cryogenic-seal.png", icon_size = 128},
      },
      prerequisites = {"advanced-material-processing"},
      effects = indium_processing_effects,
      unit =
      {
        count = 100,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 }
        },
        time = 30
      }
    },
  })
if (util.bz.tin and mods["bismuth"]) or false then
data:extend(
  {
    {
      type = "technology",
      name = "indium-pcb-solder",
      icons =
      {
        { icon = "__" .. util.bz.tin .. "__/graphics/icons/solder.png", icon_size = 128, tint = {r = 0.7, g = 0.5, b = 0.9, a = 1} },
        { icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64, shift= {-8, -8}},
      },
      prerequisites = {"indium-processing"},
      effects = {
          {
            type = "unlock-recipe",
            recipe = "indium-pcb-solder",
          }
      },
      unit =
      {
        count = 225,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 }
        },
        time = 30
      }
    },
  })
end