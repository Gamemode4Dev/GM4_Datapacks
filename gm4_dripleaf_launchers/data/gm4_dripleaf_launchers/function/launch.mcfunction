# launch into the air!
# @s = player
# at @s
# run from check

tag @s remove gm4_dl_on_dripleaf

# vfx
playsound minecraft:block.big_dripleaf.tilt_up player @s ~ ~1 ~ 3 0 1
playsound minecraft:block.beehive.enter player @s ~ ~1 ~ 1 1.6 1
execute align xyz run particle minecraft:block{block_state:"minecraft:big_dripleaf"} ~.5 ~.93751 ~.5 0.25 0.01 0.25 0 12

# grant levitation for 4 ticks
summon minecraft:area_effect_cloud ~ ~ ~ {custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},ReapplicationDelay:0,Age:-1,Radius:0.5f,RadiusPerTick:0f,RadiusOnUse:-0.5f,Duration:4,WaitTime:0,potion_contents:{custom_effects:[{id:'minecraft:levitation',amplifier:40b,duration:4,show_particles:0b,show_icon:0b,ambient:1b}]}}
