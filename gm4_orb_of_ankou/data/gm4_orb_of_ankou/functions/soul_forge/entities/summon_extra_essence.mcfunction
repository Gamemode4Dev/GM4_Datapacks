# @s = soul forge without fire with extra essence in storage
# run from soul_forge/destroy

# summon endermite
data modify entity @s ArmorItems[0].tag set from entity @s ArmorItems[1].tag
function gm4_orb_of_ankou:soul_forge/entities/severed_soul

# loop
scoreboard players remove @s gm4_oa_essence 1
execute if score @s gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_extra_essence
