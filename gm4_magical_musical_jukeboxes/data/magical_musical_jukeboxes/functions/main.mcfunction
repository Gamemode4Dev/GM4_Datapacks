#process jukebox and effects
execute as @e[type=armor_stand,tag=gm4_magical_musical_jukebox] at @s positioned ~ ~1 ~ run function magical_musical_jukeboxes:process
execute as @e[type=area_effect_cloud,tag=gm4_mmj_effects] at @s run function magical_musical_jukeboxes:apply_effects

#prime cast to be fused into a jukebox
execute as @e[type=item,nbt={Item:{Count:1b,id:"minecraft:player_head",tag:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"musical",ore_type:"barimium"}}}}] at @s align xyz positioned ~0.5 ~-1 ~0.5 unless entity @e[type=armor_stand,tag=gm4_magical_musical_jukebox,limit=1,distance=..0.1] positioned ~ ~1.5 ~ if block ~ ~1 ~ minecraft:piston[facing=down] if block ~ ~-1 ~ jukebox run tag @s[tag=!gm4_mmj_primed] add gm4_mmj_primed
