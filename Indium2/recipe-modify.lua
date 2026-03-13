local util = require("__bzlib__/data-util")

-- Main vanilla changes

-- Mod changes
if mods["IfNickel-Updated"] then
    if mods["IfNickel-Updated"] and util.bz.tungsten then
    util.replace_some_ingredient(mods["IfNickel-Updated"] and "gimbaled-thruster", util.bz.tungsten and "rocket-engine-nozzle", 1, "cryogenic-seal", 1)
    end
    util.remove_ingredient("satellite", "gimbaled-thruster")
end

if mods["space-exploration"] then
    util.add_product(mods["space-exploration"] and "se-scrap-hard-recycling", { type = "item", name = "indite-ore", amount=1, probability=0.05})

    util.remove_ingredient("se-space-pipe-to-ground", "lead-plate")
    util.remove_ingredient("se-space-pipe-to-ground", "tin-plate")
    util.add_ingredient("se-space-pipe-to-ground", "indium-solder", 1)
end