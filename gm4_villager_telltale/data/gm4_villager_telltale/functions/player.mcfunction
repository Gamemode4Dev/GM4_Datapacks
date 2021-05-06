
# give tag
tag @s add gm4_vt_holding_villager_block

# execute as nearest villager
execute if predicate gm4_villager_telltale:holding_job_block as @e[type=villager,sort=nearest,limit=1,distance=..4] at @s run function gm4_villager_telltale:villager/locate_job
execute if predicate gm4_villager_telltale:holding_home_block as @e[type=villager,sort=nearest,limit=1,distance=..4] at @s run function gm4_villager_telltale:villager/locate_bed
execute if predicate gm4_villager_telltale:holding_meeting_block as @e[type=villager,sort=nearest,limit=1,distance=..4] at @s run function gm4_villager_telltale:villager/locate_bell

# remove tag
tag @a remove gm4_vt_holding_villager_block