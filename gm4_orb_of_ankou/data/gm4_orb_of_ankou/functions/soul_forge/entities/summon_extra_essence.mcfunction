# @s = soul forge without fire with extra essence in storage
# run from soul_forge/destroy

# summon endermite
data modify storage gm4_orb_of_ankou:temp ArmorItems[0].tag set from storage gm4_orb_of_ankou:temp ArmorItems[1].tag
function gm4_orb_of_ankou:soul_forge/entities/severed_soul

# loop
scoreboard players remove @s gm4_oa_essence 1
execute if score @s gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_extra_essence
