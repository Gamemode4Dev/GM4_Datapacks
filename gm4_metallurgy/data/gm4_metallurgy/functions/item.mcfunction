# @s = an item entity
# run from main

# check for moulds waiting to be created
execute if entity @s[nbt={Item:{id:"minecraft:obsidian",Count:1b},OnGround:1b}] at @s if block ~ ~-0.1 ~ #minecraft:sand run function gm4_metallurgy:casting/check_mould_creation

data remove entity @s[tag=gm4_ml_in_animation,nbt=!{PickupDelay:30s}] Item.tag.gm4_metallurgy.ore_in_animation

# check for shamir on anvil
execute if entity @s[tag=!gm4_ml_smooshed,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}}}] at @s if block ~ ~-1 ~ #minecraft:anvil run function gm4_metallurgy:smooshing/item_on_anvil
