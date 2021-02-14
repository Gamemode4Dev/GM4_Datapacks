# @s = soul forge that has an orb and a shard
# run from soul_forge/process

# slow clock
scoreboard players add @s gm4_oa_forge 1
scoreboard players reset @s[scores={gm4_oa_forge=10..}] gm4_oa_forge

# every 160 ticks (8 seconds): spawn an indicator, wait 80 ticks (4 seconds) then consume the wither rose at that indicator if possible
execute if score @s gm4_oa_forge matches 2 run function gm4_orb_of_ankou:soul_forge/wither_roses/summon_indicator
execute if score @s gm4_oa_forge matches 8 at @e[type=area_effect_cloud,tag=gm4_oa_wither_rose_catcher,nbt={Age:96},limit=1,sort=nearest] if block ~ ~ ~ wither_rose run function gm4_orb_of_ankou:soul_forge/wither_roses/consume

# indicator particles
execute at @e[type=area_effect_cloud,tag=gm4_oa_wither_rose_catcher] run particle witch ~ ~ ~ 0 .2 0 0 7 normal
