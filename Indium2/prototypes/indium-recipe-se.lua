-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util")

if mods["space-exploration"] then
  se_delivery_cannon_recipes["indite-ore"] = {name= "indite-ore"}
  se_delivery_cannon_recipes["indium-plate"] = {name= "indium-plate"}
  util.se_landfill({ore="indite-ore"})

  util.se_matter({ore="indite-ore", energy_required=1, quant_out=10, stream_out=60})
  data:extend({
  {
    type = "item-subgroup",
    name = "indium",
    group = "resources",
    order = "a-h-z-a",
  }
  })
  util.set_item_subgroup("indium-plate", "indium")
  data:extend({
  {
    type = "item",
    name = "indium-ingot",
    icons = {{icon = "__Indium2__/graphics/icons/indium-ingot.png", icon_size = 64}},
    order = "b-b",
    stack_size = 50,
    subgroup = "indium",
  },
  {
    type = "fluid",
    name = "molten-indium",
    default_temperature = 232,
    max_temperature = 232,
    base_color = {r=191, g=219, b=233},
    flow_color = {r=191, g=219, b=233},
    icons = {{icon = "__Indium2__/graphics/icons/molten-indium.png", icon_size = 64}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-indium",
    subgroup = "indium",
    results = {
      {type = "fluid", name = "molten-indium", amount = mods["Krastorio2"] and 750 or 900},
    },
    energy_required = 45,
    ingredients = {
      {type = "item", name = mods["Krastorio2"] and "enriched-indium" or "indite-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "indium-ingot",
    category = "casting",
    results = {{type="item", name="indium-ingot", amount=1}},
    energy_required = 18.75,
    ingredients = {
      {type = "fluid", name = "molten-indium", amount = 250},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "indium-ingot-to-plate",

    icons = {
      {icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64},
      {icon = "__Indium2__/graphics/icons/indium-ingot.png", icon_size = 32, scale = 0.125, shift = {-8, -8}},
    },
    results = {
      {type = "item", name = "indium-plate", amount = 10},
    },
    energy_required = 3.75,
    ingredients = {
      {type = "item", name = "indium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "molten-indium"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "indium-ingot"})
  util.add_effect("se-pyroflux-smelting", {type = "unlock-recipe", recipe= "indium-ingot-to-plate"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-indium"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "indium-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "indium-ingot-to-plate"})
  if mods["Krastorio2"] then
    util.set_item_subgroup("enriched-indium", "indium")
    data.raw.recipe["enriched-indium-plate"].order= "d[indium-plate]"
    se_delivery_cannon_recipes["enriched-indium"] = {name= "enriched-indium"}
  end
  se_delivery_cannon_recipes["indium-ingot"] = {name= "indium-ingot"}

end