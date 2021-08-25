# @s = brewing stand marker that just finished brewing
# run from finish_brew

execute if entity @s[nbt={data:{Items:[{Slot:3b,id:"minecraft:gunpowder"}]}}] run function gm4_brewing-1.0:finalize_potions/splash/check_items
execute if entity @s[nbt={data:{Items:[{Slot:3b,id:"minecraft:dragon_breath"}]}}] run function gm4_brewing-1.0:finalize_potions/lingering/check_items

function #gm4_brewing:finish_brew
