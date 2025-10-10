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
        icon = "__Krastorio2Assets__/technologies/matter-coal.png",
        icon_size = 256,
      },
      {
        icon = "__Indium2__/graphics/icons/indite-ore.png",
        icon_size = 64,
        scale = 1.4,
      }
    },
    prerequisites = {"kr-matter-processing"},
    unit =
  	{
      count = 350,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"matter-tech-card", 1}
      },
      time = 45
    }
  },
})

matter.createMatterRecipe({
  material = { type = "item", name = "indite-ore", amount = 10 },
  item_name = "indite-ore",
  matter_count = 5,
  energy_required = 1,
  need_stabilizer = false,
  unlocked_by_technology = "indium-matter-processing"
})

matter.createMatterRecipe({
  material = { type = "item", name = "indium-plate", amount = 10 },
  minimum_conversion_quantity = 10,
  matter_count = 10,
  energy_required = 3,
  only_deconversion = true,
  need_stabilizer = true,
  unlocked_by_technology = "indium-matter-processing"
})
end