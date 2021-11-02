# @s = soul essence item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from both soul_forge/recipes/add_first_soul_essence 
# and soul_forge/recipes/check_soul_essence

tag @s add gm4_oa_checked_item
playsound minecraft:entity.blaze.ambient block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.2 0.6
particle minecraft:cloud ~0.5 ~1.5 ~0.5 0.2 1 0.2 0.01 5

# add item stack count to scoreboard storage
execute store result score add gm4_oa_essence run data get storage gm4_orb_of_ankou:temp Item.Count
scoreboard players operation @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] gm4_oa_essence += add gm4_oa_essence
