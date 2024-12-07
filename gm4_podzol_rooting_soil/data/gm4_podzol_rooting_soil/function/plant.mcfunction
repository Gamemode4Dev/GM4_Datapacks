# @s = sapling item on podzol and within air-like block that has passed the randomizer
# at @s
# called from gm4_podzol_rooting_soil:process_item

# place sapling block
function gm4_podzol_rooting_soil:place_block with entity @s Item

# plant custom sapling
execute if items entity @s contents *[custom_data~{gm4_podzol_rooting_soil:{}}] run function #gm4_podzol_rooting_soil:plant_custom_sapling

# sounds and visuals
execute align xyz positioned ~.5 ~.5 ~.5 run particle minecraft:happy_villager ~ ~ ~ .3 .3 .3 1 10 normal
playsound minecraft:block.chorus_flower.grow block @a[distance=..6] ~ ~ ~ 0.2 0.8

# remove sapling item
item modify entity @s contents {function:"minecraft:set_count",count:-1,add:true}
