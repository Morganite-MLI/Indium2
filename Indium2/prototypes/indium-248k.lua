local util = require("__bzlib__/data-util")

if mods["248k-Redux"] then
data:extend({
    {
        type = "fluid",
        name = "fi-arc-pure-indium",
        default_temperature = 1900,
        max_temperature = 2650,
        heat_capacity = "100kJ",
        base_color = { r=0.92, g=0.29, b=0.22 },
        flow_color = { r=0.92, g=0.29, b=0.22 },
        pressure_to_speed_ratio = 0.400,
        flow_to_energy_ratio = 0,
        icon = "__Indium2__/graphics/icons/fi-arc-pure-indium.png",
        icon_size = 64, icon_mipmaps = 4,
        order = "a-a"
    },
    {
        type = "item",
        name = "fi-materials-pure-indium",
        icon = "__Indium2__/graphics/icons/fi-materials-pure-indium.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "fi_item_subgroup_a-c",
        order = "b-a",
    },
    {
        type = "recipe",
        name = "fi-purify-indium-recipe",
        enabled = false,
        category = "el_purifier_category",
        main_product = "el_dirty_water",
        ingredients = {
            {type="fluid", name="water", amount=50},
            {type="item", name="indite-ore", amount=10}
        },
        results = {
            {type="fluid", name="el_dirty_water", amount=50},
            {type="item", name="fi-materials-pure-indium", amount=5},
        },
        energy_required = 1,
        always_show_made_in = true,
        icon_size = 64,
        icons = (mods["Krastorio2"] and
        {
          { icon = "__248k-Redux-graphics__/ressources/fluids/el_dirty_water.png", icon_size = 64},
          { icon = "__Indium2__/graphics/icons/indite-ore.png", icon_size = 64, scale=0.2, shift= {-8, -8}},
        } or {
          { icon = "__Indium2__/graphics/icons/indite-ore.png", icon_size = 64},
        }),
        group = "fi_item_group",
        subgroup = "fi_item_subgroup_f",
        order = "f-a",
    },
    {
        type = "recipe",
        name = "fi-arc-pure-indium-recipe",
        enabled = false,
        category = "el_arc_furnace_category",
        ingredients = {
            {type="item", name="fi-materials-pure-indium", amount=1},
        },
        results = {
            {type="fluid", name="fi-arc-pure-indium", amount=200},
        },
        energy_required = 0.2,
        order = "a-b",
        group = "fi_item_group",
        subgroup = "fi_item_subgroup_f",
        always_show_made_in = true
    },
    {
        type = "recipe",
        name = "fi-cast-pure-indium-recipe",
        enabled = false,
        category = "el_caster_category",
        ingredients = {
            {type="fluid", name="fi-arc-pure-indium", amount=100},
        },
        results = {
            {type="item", name="indium-plate", amount=1},
        },
        energy_required = 0.2,
        order = "a-b",
        always_show_made_in = true,
        allow_decomposition = false
    }
})
util.add_unlock("fi_caster_tech","fi-arc-pure-indium-recipe")
util.add_unlock("fi_caster_tech","fi-cast-pure-indium-recipe")
util.add_unlock("fi_purifier_tech","fi-purify-indium-recipe")
end