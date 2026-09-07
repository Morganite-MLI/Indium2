local resource_autoplace = require('resource-autoplace');
local item_sounds = require('__base__.prototypes.item_sounds')
local util = require("data-util")

data.raw.planet.nauvis.map_gen_settings.autoplace_controls["indite-ore"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["indite-ore"] = {}
resource_autoplace.initialize_patch_set("indite-ore", true)

data:extend({
  {
    type = "autoplace-control",
    category = "resource",
    name = "indite-ore",
    richness = true,
    order = "b-e"
  },
  {
    type = "resource",
    icon_size = 64,
    icon_mipmaps = 3,
    name = "indite-ore",
    icon = "__Indium2__/graphics/icons/indite-ore.png",
    flags = { "placeable-neutral" },
    order = "a-b-a",
    map_color = { r = 0.95, g = 0.50, b = 0.50 },
    minable =
    {
      hardness = 2,
      mining_particle = "copper-ore-particle",
      mining_time = 2,
      result = "indite-ore"
    },
    collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },

    autoplace = resource_autoplace.resource_autoplace_settings {
      name = "indite-ore",
      order = "b-z",
      base_density = 1,
      base_spots_per_km2 = 1,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.0,
    },

    stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
    stages =
    {
      sheet =
      {
        filename = "__Indium2__/graphics/entity/ores/hr-indite-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
  },
  {
    type = "item",
    name = "indite-ore",
    icon_size = 64,
    icon_mipmaps = 3,
    icon = "__Indium2__/graphics/icons/indite-ore.png",
    subgroup = "raw-resource",
    order = "t-c-a",
    stack_size = 50,
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move
  },
})

if mods["Krastorio2"] then
  util.add_product("kr-enriched-copper", { type = "item", name = "indite-ore", amount = 1, independent_probability = 0.09 })
end
