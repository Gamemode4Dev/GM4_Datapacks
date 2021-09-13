# processes an arborist during working hours
# @s = @s[tag=gm4_gv_arborist]
# at @s
# run from gm4_garden_variety:mechanics/arborist_villager/process


# check if villager can restock
execute if entity @s[tag=!gm4_gv_can_restock,tag=gm4_gv_has_job_site] if score @s gm4_gv_trades matches 1.. if score $xp_value gm4_gv_arborist > @s gm4_gv_prev_xp run function gm4_garden_variety:mechanics/arborist_villager/trading/can_restock
execute if entity @s[tag=gm4_gv_can_restock] run function gm4_garden_variety:mechanics/arborist_villager/trading/restock_attempt
