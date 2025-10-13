local util = require("data-util")

data:extend({{
  type = "item-subgroup",
  name = "indium",
  group = "intermediate-products",
  order = "i"
}})

data:extend({
  {
    type = "item",
    name = "indium-plate",
    icon = "__Indium2__/graphics/icons/indium-plate.png",
    icon_size = 64,
    subgroup = "indium",
    order = "b[indium-plate]",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "indium-plate",
    category = "smelting",
    order = "d[indium-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64},
          { icon = "__Indium2__/graphics/icons/indite-ore.png", icon_size = 64, scale=0.125, shift= {-8, -8}},
        } or {
          { icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64},
        }
    ),
    subgroup = "indium",
    main_product = "indium-plate",
    enabled = false,
    energy_required = 12,
    ingredients = {{type="item", name="indite-ore", amount=10}},
    results = {{type="item", name = "indium-plate", amount=5}}
  },
})

local solder_ingredients = {{type="item", name="indium-plate", amount=6}}
if mods["bzlead"] then
  solder_ingredients = {{type="item", name="indium-plate", amount=3}, {type="item", name="lead-plate", amount=3}}
end
local solder_category = "crafting"
local solder_subgroup = "intermediate-product"
if mods["bzfoundry"] then
  solder_category = "founding"
  solder_subgroup = "foundry-intermediate"
end
data:extend({
  {
    type = "item",
    name = "indium-solder",
    icon = "__Indium2__/graphics/icons/indium-solder.png",
    icon_size = 64,
    group = "intermediate-products",
    subgroup = solder_subgroup,
    order = "b[solder]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "indium-solder",
    category = solder_category,
    order = "d[solder]",
    enabled = false,
    energy_required = 4,
    ingredients = solder_ingredients,
    results = {{type="item", name="indium-solder", amount=4}},
  }
})

data:extend({
  {
    type = "item",
    name = "cryogenic-seal",
    icon = "__Indium2__/graphics/icons/cryogenic-seal.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[cryogenic-seal]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "cryogenic-seal",
    category = "advanced-crafting",
    order = "d[cryogenic-seal]",
    enabled = false,
    energy_required = 4,
    ingredients = {{type="item", name="steel-plate", amount=3}, {type="item", name="indium-solder", amount=1}},
    results = {{type="item", name="cryogenic-seal", amount=1}},
  }
})

if mods["bzsilicon"] and data.raw.item["solar-cell"] then
  local solar_cell_ingredients = {{type="item", name="copper-plate", amount=1}, {type="item", name="indium-plate", amount=1}, {type="item", name="electronic-circuit", amount=2}}
  if mods["Krastorio2"] then
    table.insert(solar_cell_ingredients, {type="item", name="kr-rare-metals", amount=1})
  end
  data:extend({
    {
      type = "recipe",
      name = "indium-solar-cell",
      icons =
            {
                { icon = "__bzsilicon__/graphics/icons/solar-cell.png", icon_size = 64 },
                { icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64, scale=0.2, shift= {-8, -8}},
            },
      category = "advanced-crafting",
      order = "ab",
      enabled = false,
      energy_required = 4,
      ingredients = solar_cell_ingredients,
      results = {{type="item", name="solar-cell", amount=4}},
    }
  })
  util.add_unlock("solar-energy","indium-solar-cell")
  util.add_productivity("indium-solar-cell")
end

local solder_pcb_ingredients = {{type="item", name="indium-plate", amount=10}}
if mods["bztin"] then
  solder_pcb_ingredients = {{type="item", name="indium-plate", amount=6}, {type="item", name="tin-plate", amount=5}}
end
local solder_pcb_category = "crafting"
local solder_pcb_subgroup = "intermediate-product"
if mods["bzfoundry"] then
  solder_pcb_category = "founding"
  solder_pcb_subgroup = "foundry-intermediate"
end
if mods["bismuth"] and mods["bztin"] then
  data:extend({
    {
      type = "recipe",
      name = "indium-pcb-solder",
      icons = {
                  { icon = "__bztin__/graphics/icons/solder.png", icon_size = 128, tint = {r = 0.7, g = 0.5, b = 0.9, a = 1} },
                  { icon = "__Indium2__/graphics/icons/indium-plate.png", icon_size = 64, scale=0.2, shift= {-8, -8}},
                },
      group = "intermediate-products",
      subgroup = solder_pcb_subgroup,
      category = solder_pcb_category,
      order = "c[pcb-solder]",
      enabled = false,
      energy_required = 2,
      ingredients = solder_pcb_ingredients,
      results = {{type="item", name="pcb-solder", amount=6}},
    }
  })
  util.add_productivity("indium-pcb-solder")
end

if mods["BrassTacks-Updated"] and data.raw.item["airtight-seal"]then
  data:extend({
    {
      type = "recipe",
      name = "indium-airtight-seal",
      icons =
            {
                { icon = "__BrassTacks-Updated__/graphics/galdoc/icons/airtight-seal.png", icon_size = 64 },
                { icon = "__Indium2__/graphics/icons/indium-solder.png", icon_size = 64, scale=0.2, shift= {-8, -8}},
            },
      category = "advanced-crafting",
      order = "c",
      enabled = false,
      energy_required = 5,
      ingredients = {{type="item", name="bolted-flange", amount=1},mods["bzcarbon"] and {type="item", name="graphite", amount=4}, {type="item", name="indium-solder", amount=2}},
      results = {{type="item", name="airtight-seal", amount=2}},
    }
  })
  if mods["IfNickel-Updated"] and data.raw.item["advanced-flow-controller"] then
    util.add_unlock("advanced-flow-controller","indium-airtight-seal")
  end
  util.add_productivity("indium-airtight-seal")
end

local blank_advanced_tech_card_ingredients = {(data.raw.item["kr-blank-tech-card"] and {type="item", name="kr-blank-tech-card", amount=2}) or {type="item", name="steel-plate", amount=2},(data.raw.item[mods["Krastorio2"] and "kr-glass" or "glass"] and {type="item", name=mods["Krastorio2"] and "kr-glass" or "glass", amount=5}) or {type="item", name="copper-cable", amount=5}, {type="item", name="indium-solder", amount=2}, (data.raw.item["el_energy_crystal_item"] and {type="item", name="el_energy_crystal_item", amount=1}) or {type="item", name="battery", amount=1}}
if mods["bismuth"] then
  blank_advanced_tech_card_ingredients = {(data.raw.item["kr-blank-tech-card"] and {type="item", name="kr-blank-tech-card", amount=2}) or {type="item", name="steel-plate", amount=2}, {type="item", name="bismuth-glass", amount=4}, {type="item", name="indium-solder", amount=2}, (data.raw.item["el_energy_crystal_item"] and {type="item", name="el_energy_crystal_item", amount=1}) or {type="item", name="battery", amount=1}}
end

data:extend({
  {
    type = "item",
    name = "blank-advanced-tech-card",
    icon = "__Indium2__/graphics/icons/blank-advanced-tech-card.png",
    icon_size = 64,
    group = "science",
    subgroup = "science-pack",
    order = "a01",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "blank-advanced-tech-card",
    category = "crafting",
    order = "a01",
    enabled = false,
    energy_required = 4,
    ingredients = blank_advanced_tech_card_ingredients,
    results = {{type="item", name="blank-advanced-tech-card", amount=3}},
  }
})
util.add_unlock("chemical-science-pack", "blank-advanced-tech-card")
util.add_productivity("indium-plate")
util.add_productivity("indium-solder")
util.add_productivity("cryogenic-seal")
util.add_productivity("blank-advanced-tech-card")