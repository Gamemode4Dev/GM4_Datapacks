# @s = item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from tick

# if valid item, add it to the scoreboard storage
execute if entity @s[nbt={Item:{id:"minecraft:blaze_powder"}}] run function gm4_orb_of_ankou:soul_forge/recipes/add_blaze_powder
execute if entity @s[tag=!gm4_oa_checked_item,nbt={Item:{id:"minecraft:glowstone_dust"}}] run function gm4_orb_of_ankou:soul_forge/recipes/add_glowstone_dust
execute if entity @s[tag=!gm4_oa_checked_item,nbt={Item:{id:"minecraft:ghast_tear"}}] run function gm4_orb_of_ankou:soul_forge/recipes/add_ghast_tear

execute if entity @s[tag=!gm4_oa_checked_item,nbt={Item:{id:"minecraft:black_dye",tag:{gm4_orb_of_ankou:{}}}}] run function gm4_orb_of_ankou:soul_forge/recipes/check_soul_essence
execute if entity @s[tag=!gm4_oa_checked_item,nbt={Item:{id:"minecraft:flint",tag:{gm4_orb_of_ankou:{}}}}] run function gm4_orb_of_ankou:soul_forge/recipes/check_shard
execute if entity @s[tag=!gm4_oa_checked_item,nbt={Item:{id:"minecraft:firework_star",tag:{gm4_orb_of_ankou:{}}}}] run function gm4_orb_of_ankou:soul_forge/recipes/check_orb

# play burn sound and kill item
execute unless entity @s[tag=gm4_oa_checked_item] run playsound minecraft:entity.generic.burn block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.2 1.5
kill @s
