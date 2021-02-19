# @s = soul in a lantern being "teased" by a player / raycast of placed soul in a lantern near its linked player
# from soul_lantern/process or player/ray_summon

# release soul (angry)
summon vex ~ ~.5 ~ {CustomName:"\"an angry roaming soul\"",Tags:["gm4_angry_soul_fragment"],Passengers:[{id:"minecraft:area_effect_cloud",Tags:["gm4_sf_soul_tracker","gm4_sf_new_soul_tracker"],Particle:"block air",Radius:0,Age:-2147483648,Duration:2147483647,CustomName:'"gm4_soul_tracker"'}],CustomNameVisible:0,ActiveEffects:[{Id:14,Amplifier:0,Duration:20000000,ShowParticles:0b}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,Damage:3,tag:{SkullOwner:{Id:[I;391035025,1300776712,-1343494369,-129461782],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYxMzQ4OTc0NTk4OCwKICAicHJvZmlsZUlkIiA6ICI3NzI3ZDM1NjY5Zjk0MTUxODAyM2Q2MmM2ODE3NTkxOCIsCiAgInByb2ZpbGVOYW1lIiA6ICJsaWJyYXJ5ZnJlYWsiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTJlYWYwOGQxZDc5N2U4NWMwNGNkMTEwYjc4MjQ5OWViNzcwYjM2MTFiYjBjZDdmNTExODQ5NTY2NDFkMDYxMSIsCiAgICAgICJtZXRhZGF0YSIgOiB7CiAgICAgICAgIm1vZGVsIiA6ICJzbGltIgogICAgICB9CiAgICB9CiAgfQp9"}]}}}}],ArmorDropChances:[0.0F,0.0F,0.0F,-327.670F],Silent:1,DeathLootTable:"minecraft:empty",Health:5.0f}

# copy ID from lantern into tracker's score
scoreboard players operation @e[type=area_effect_cloud,tag=gm4_sf_new_soul_tracker,distance=...6,limit=1] gm4_sf_id = @s gm4_sf_id
tag @e[type=area_effect_cloud,tag=gm4_sf_new_soul_tracker] remove gm4_sf_new_soul_tracker

# visuals
particle minecraft:soul ~ ~.3 ~ .3 0 .2 .03 5 normal
playsound minecraft:block.chorus_flower.grow neutral @a[distance=..16] ~ ~ ~ .9 1.5

# revert to regular lantern if called by lantern
execute if entity @s[type=item] run function gm4_soul_fragments:soul_lantern/wipe
