# @s = player taking damage while holding a soul in a lantern
# from player/items/check_held_id_dmg

# release soul (angry)
summon vex ^ ^.2 ^.2 {CustomName:"\"an angry roaming soul\"",Tags:["gm4_angry_soul_fragment"],Passengers:[{id:"minecraft:area_effect_cloud",Tags:["gm4_sf_soul_tracker","gm4_sf_main_soul_tracker"],Particle:"block air",Radius:0,Age:-2147483648,Duration:2147483647,CustomName:'"gm4_soul_tracker"'}],CustomNameVisible:0,ActiveEffects:[{Id:14,Amplifier:0,Duration:20000000,ShowParticles:0b}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,Damage:3,tag:{SkullOwner:{Id:[I;391035025,1300776712,-1343494369,-129461782],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYxMzQ4OTc0NTk4OCwKICAicHJvZmlsZUlkIiA6ICI3NzI3ZDM1NjY5Zjk0MTUxODAyM2Q2MmM2ODE3NTkxOCIsCiAgInByb2ZpbGVOYW1lIiA6ICJsaWJyYXJ5ZnJlYWsiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTJlYWYwOGQxZDc5N2U4NWMwNGNkMTEwYjc4MjQ5OWViNzcwYjM2MTFiYjBjZDdmNTExODQ5NTY2NDFkMDYxMSIsCiAgICAgICJtZXRhZGF0YSIgOiB7CiAgICAgICAgIm1vZGVsIiA6ICJzbGltIgogICAgICB9CiAgICB9CiAgfQp9"}]}}}}],ArmorDropChances:[0.0F,0.0F,0.0F,-327.670F],Silent:1,DeathLootTable:"minecraft:empty",Health:5.0f}

# copy ID from lantern into tracker's score
execute store result score @e[type=area_effect_cloud,tag=gm4_sf_main_soul_tracker,distance=...5,limit=1,sort=nearest] gm4_sf_id run data get entity @s SelectedItem.tag.gm4_soul_fragments.id
tag @e[type=area_effect_cloud,tag=gm4_sf_main_soul_tracker] remove gm4_sf_main_soul_tracker

execute if predicate gm4_soul_fragments:count_one/in_mainhand run replaceitem entity @s weapon.mainhand minecraft:soul_lantern
#execute if predicate gm4_soul_fragments:count_one/in_mainhand run item entity @s weapon.mainhand replace minecraft:soul_lantern
execute unless predicate gm4_soul_fragments:count_one/in_mainhand run function gm4_soul_fragments:player/items/process_mainhand_stack
