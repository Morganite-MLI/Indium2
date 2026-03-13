local util = require("__bzlib__/data-util")

if mods["Krastorio2"] then
data:extend({
  {
    type = "item",
    name = "enriched-indium",
    icon_size = 64,
    icon = "__Indium2__/graphics/icons/enriched-indium.png",
    subgroup = "indium",
    order = "b",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "enriched-indium",
    main_product="enriched-indium",
    icons =
              {
                { icon = "__Indium2__/graphics/icons/enriched-indium.png", icon_size = 64 },
                { icon = "__Indium2__/graphics/icons/indite-ore.png", icon_size = 64, scale=0.15, shift= {-8, -8}},
              },
    category = "chemistry",
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    subgroup = "indium",
    ingredients =
    {
      {type = "fluid", name = "kr-hydrogen-chloride", amount = 3},
      {type = "fluid", name = "water", amount = 25, ignored_by_productivity = 25, ignored_by_stats = 25},
      {type = "item",  name = "indite-ore", amount = 9}
    },
    results =
    {
      {type = "item",  name = "enriched-indium", amount = 6},
      {type = "fluid", name = "kr-dirty-water", amount = 25, ignored_by_productivity = 25, ignored_by_stats = 25}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.721, g = 0.525, b = 0.043, a = 0.000},
      secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.357},
      tertiary = {r = 0.690, g = 0.768, b = 0.870, a = 0.000},
      quaternary = {r = 0.0, g = 0.980, b = 0.603, a = 0.900}
    },
    order = "e03[enriched-indium]"
  },
  {
      type = "recipe",
      name = "enriched-indium-plate",
      icons =
      {
        { icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64 },
        { icon = "__Indium2__/graphics/icons/enriched-indium.png", icon_size = 64, scale=0.125, shift= {-8, -8}},
      },
      category = "smelting",
      energy_required = 16,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      ingredients = { {type="item", name="enriched-indium", amount=5} },
      results = { {type="item", name="indium-plate", amount=5} },
      order = "b",
  },
	{
		type = "recipe",
		name = "dirty-water-filtration-indium",
		category = "kr-fluid-filtration",
		icons =
		{
			{
				icon = data.raw.fluid["kr-dirty-water"].icon,
				icon_size = data.raw.fluid["kr-dirty-water"].icon_size
			},
			{
				icon = data.raw.item["indite-ore"].icon,
				icon_size =	data.raw.item["indite-ore"].icon_size,
				scale = 0.20,
				shift = {0, 4}
			}
		},
		icon_size = data.raw.fluid["kr-dirty-water"].icon_size,
		energy_required = 2,
		enabled = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "kr-dirty-water", amount = 100, ignored_by_productivity = 100, ignored_by_stats = 100},
		},
		results =
		{
			{type = "fluid", name = "water", amount = 90, ignored_by_productivity = 90, ignored_by_stats = 90},
			{type = "item",  name = "stone", probability = 0.40, amount = 1},
			{type = "item",  name = "indite-ore", probability = 0.10, amount = 1},
		},
		crafting_machine_tint =
		{
			primary = {r = 0.60, g = 0.20, b = 0, a = 0.6},
			secondary = {r = 1.0, g = 0.843, b = 0.0, a = 0.9}
		},
    subgroup = "indium",
		order = "b"
	}
})
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-indium" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-indium-plate" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "dirty-water-filtration-indium" })

util.add_productivity("enriched-indium")
util.add_productivity("enriched-indium-plate")

end