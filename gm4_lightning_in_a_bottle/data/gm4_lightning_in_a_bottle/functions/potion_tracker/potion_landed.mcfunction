# force-kills tracker markers in case they are in lazy loaded chunks
# @s = gm4_liab_potion_tracker markers
# at world spawn
# run from potion_tracker/check_splash

summon lightning_bolt ~ ~ ~
execute as @e[type=area_effect_cloud,distance=..0.05,limit=1,sort=nearest] if data entity @s Effects[{Id:16b,Amplifier:12b,Duration:1,Ambient:0b,ShowIcon:1b,ShowParticles:1b}] run tag @s add gm4_liab_lingering
execute as @e[type=area_effect_cloud,distance=..0.05,limit=1,sort=nearest] if data entity @s Effects[{Id:16b,Amplifier:12b,Duration:1,Ambient:0b,ShowIcon:1b,ShowParticles:1b}] run data modify entity @s Particle set value "minecraft:electric_spark"
