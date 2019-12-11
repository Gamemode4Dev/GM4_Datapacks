# @s = the entity to strike itself
# MUST be at @s
# ran from conduction_shamir:failed_to_deplete_charge and conduction_shamir:deselected_tool

#summon new strike point
summon area_effect_cloud ~ ~ ~ {Duration:20,CustomName:"\"gm4_conduction_strike_point\"",Tags:["gm4_conduction_strike_point"]}

#summon lightning and kill
execute as @e[type=area_effect_cloud,tag=gm4_conduction_strike_point,distance=..0.1,limit=1] run function conduction_shamir:self_strike/summon_lightning
