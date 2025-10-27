-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local matter = require("__Krastorio2__/prototypes/libraries/matter")

data:extend(
{
  {
    type = "technology",
    name = "indium-matter-processing",
    icons =
    {
      {
        icon = "__Krastorio2Assets__/technologies/backgrounds/matter.png",
        icon_size = 256,
      },
      {
        icon = "__Indium2__/graphics/icons/indite-ore.png",
        icon_size = 64,
        scale = 1,
      }
    },
    effects = {},
    prerequisites = {"kr-matter-processing"},
    unit =
  	{
      count = 350,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"kr-matter-tech-card", 1}
      },
      time = 45
    }
  },
})

matter.make_recipes({
  material = { type = "item", name = "indite-ore", amount = 10 },
  matter_count = 5,
  energy_required = 1,
  needs_stabilizer = false,
  unlocked_by = "indium-matter-processing"
})

matter.make_deconversion_recipe({
  material = { type = "item", name = "indium-plate", amount = 10 },
  matter_count = 10,
  energy_required = 3,
  -- only_deconversion = true,
  needs_stabilizer = true,
  unlocked_by = "indium-matter-processing"
})
end