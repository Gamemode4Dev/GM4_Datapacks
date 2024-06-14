# force-kills tracker markers in case they are in lazy loaded chunks
# @s = gm4_liab_potion_tracker markers
# at world spawn
# run from potion_tracker/verify_landed_potion

execute if block ~ ~-1 ~ lightning_rod align y run summon lightning_bolt ~ ~ ~
execute unless block ~ ~-1 ~ lightning_rod run summon lightning_bolt ~ ~ ~
execute as @e[type=area_effect_cloud,distance=..0.05,limit=1,sort=nearest,nbt={potion_contents:{custom_effects:[{id:'minecraft:night_vision',amplifier:12b,duration:1}]}}] run function gm4_lightning_in_a_bottle:potion_tracking/modify_cloud
