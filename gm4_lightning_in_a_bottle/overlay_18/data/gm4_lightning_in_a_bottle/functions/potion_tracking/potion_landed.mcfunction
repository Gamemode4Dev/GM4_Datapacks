# force-kills tracker markers in case they are in lazy loaded chunks
# @s = gm4_liab_potion_tracker markers
# at world spawn
# run from potion_tracker/check_splash

execute if block ~ ~-1 ~ lightning_rod align y run summon lightning_bolt ~ ~ ~
execute unless block ~ ~-1 ~ lightning_rod run summon lightning_bolt ~ ~ ~
execute as @e[type=area_effect_cloud,distance=..0.05,limit=1,sort=nearest] if data entity @s effects[{id:'minecraft:night_vision',amplifier:12b,duration:1,ambient:0b,show_icon:1b,show_particles:1b}] run function gm4_lightning_in_a_bottle:potion_tracking/modify_cloud
