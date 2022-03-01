# @s = orb of ankou item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from soul_forge/recipes/check_orb

tag @s add gm4_oa_checked_item
playsound minecraft:entity.blaze.ambient block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.2 0.6
particle minecraft:cloud ~0.5 ~1.5 ~0.5 0.2 1 0.2 0.01 5

# add single orb to forge storage
data modify storage gm4_orb_of_ankou:temp ArmorItems[3] set from storage gm4_orb_of_ankou:temp Item
data modify storage gm4_orb_of_ankou:temp ArmorItems[3].Count set value 1b
tag @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] add gm4_oa_has_orb

# convert extra orbs to living orbs
execute store result score orb_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp Item.Count
scoreboard players remove orb_count gm4_oa_forge 1
execute if score orb_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_living_orb
