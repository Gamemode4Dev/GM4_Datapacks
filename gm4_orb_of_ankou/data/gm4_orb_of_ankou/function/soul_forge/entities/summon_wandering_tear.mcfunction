# @s = soul forge without fire with extra ghast tears in storage
# run from soul_forge/destroy

# summon vex
function gm4_orb_of_ankou:soul_forge/entities/wandering_tear

# loop
scoreboard players remove @s gm4_oa_tears 1
execute if score @s gm4_oa_tears matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_wandering_tear
