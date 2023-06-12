# @s = brewing stand marker that just finished brewing
# run from finish_brew

execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[{Slot:3b,id:"minecraft:gunpowder"}]}}}] run function gm4_brewing:finalize_potions/splash/check_items
execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[{Slot:3b,id:"minecraft:dragon_breath"}]}}}] run function gm4_brewing:finalize_potions/lingering/check_items

function #gm4_brewing:finish_brew
