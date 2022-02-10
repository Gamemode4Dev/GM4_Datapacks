# @s = item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from tick

# tag the armor soul forge
tag @e[type=armor_stand,tag=gm4_soul_forge,limit=1,sort=nearest,distance=..1] add gm4_oa_selected_forge
data modify storage gm4_orb_of_ankou:temp ArmorItems set from entity @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] ArmorItems

# if valid item, add it to the scoreboard storage
data modify storage gm4_orb_of_ankou:temp Item set from entity @s Item
execute if data storage gm4_orb_of_ankou:temp Item{id:"minecraft:blaze_powder"} run function gm4_orb_of_ankou:soul_forge/recipes/add_blaze_powder
execute unless entity @s[tag=gm4_oa_checked_item] if data storage gm4_orb_of_ankou:temp Item{id:"minecraft:glowstone_dust"} run function gm4_orb_of_ankou:soul_forge/recipes/add_glowstone_dust
execute unless entity @s[tag=gm4_oa_checked_item] if data storage gm4_orb_of_ankou:temp Item{id:"minecraft:ghast_tear"} run function gm4_orb_of_ankou:soul_forge/recipes/add_ghast_tear

execute unless entity @s[tag=gm4_oa_checked_item] if data storage gm4_orb_of_ankou:temp Item{id:"minecraft:black_dye",tag:{gm4_orb_of_ankou:{item:"soul_essence"}}} run function gm4_orb_of_ankou:soul_forge/recipes/check_soul_essence
execute unless entity @s[tag=gm4_oa_checked_item] if data storage gm4_orb_of_ankou:temp Item{id:"minecraft:flint",tag:{gm4_orb_of_ankou:{item:"soul_shard"}}} run function gm4_orb_of_ankou:soul_forge/recipes/check_shard
execute unless entity @s[tag=gm4_oa_checked_item] if data storage gm4_orb_of_ankou:temp Item{id:"minecraft:firework_star",tag:{gm4_orb_of_ankou:{item:"orb"}}} run function gm4_orb_of_ankou:soul_forge/recipes/check_orb

# apply data modify to armor stand
data modify entity @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] ArmorItems set from storage gm4_orb_of_ankou:temp ArmorItems
tag @e[type=armor_stand,tag=gm4_soul_forge] remove gm4_oa_selected_forge
data remove storage gm4_orb_of_ankou:temp ArmorItems

# play burn sound and kill item
execute unless entity @s[tag=gm4_oa_checked_item] run playsound minecraft:entity.generic.burn block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.2 1.5
kill @s
data remove storage gm4_orb_of_ankou:temp Item
