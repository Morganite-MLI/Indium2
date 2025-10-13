local util = require("data-util")

util.remove_ingredient("chemical-science-pack", "kr-blank-tech-card")
util.remove_ingredient("chemical-science-pack", "bismuth-glass")
util.remove_ingredient("chemical-science-pack", "el_energy_crystal_item")
util.add_ingredient("chemical-science-pack", "blank-advanced-tech-card", 5)

if mods["space-exploration"] then
    util.remove_ingredient("se-rocket-science-pack", "kr-blank-tech-card")
    util.add_ingredient("se-rocket-science-pack", "blank-advanced-tech-card", 8)
    util.add_product("se-core-fragment-omni",{ type = "item", name = "indite-ore", amount = 3 })
end

if mods["BrassTacks-Updated"] and mods["Krastorio2"] then
    util.set_main_product("enriched-zinc", "enriched-zinc")
    util.add_product("enriched-zinc", { type = "item", name = "indite-ore", amount=1})
    util.set_main_product("zinc-plate", "zinc-plate")
    util.add_product("zinc-plate", {type = "item", name="indium-plate", amount=1, probability=0.1})
end