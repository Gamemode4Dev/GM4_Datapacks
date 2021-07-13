# @s = fishing bait armor stand that is nearly ready to be reeled in
# run from process

summon marker ~ ~ ~ {Tags:["gm4_ef_particle_new","gm4_ef_particle"]}
execute store result score $rand gm4_ef_data run data get entity @e[type=marker,tag=gm4_ef_particle_new,limit=1] UUID[0]
scoreboard players operation $rand gm4_ef_data %= #4 gm4_ef_data

execute if score $rand gm4_ef_data matches 0 run tp @e[type=marker,tag=gm4_ef_particle_new,limit=1] ~ ~ ~3 facing entity @s eyes
execute if score $rand gm4_ef_data matches 1 run tp @e[type=marker,tag=gm4_ef_particle_new,limit=1] ~ ~ ~-3 facing entity @s eyes
execute if score $rand gm4_ef_data matches 2 run tp @e[type=marker,tag=gm4_ef_particle_new,limit=1] ~3 ~ ~ facing entity @s eyes
execute if score $rand gm4_ef_data matches 3 run tp @e[type=marker,tag=gm4_ef_particle_new,limit=1] ~-3 ~ ~ facing entity @s eyes
tag @e[type=marker,tag=gm4_ef_particle] remove gm4_ef_particle_new
scoreboard players reset $rand gm4_ef_data

schedule function gm4_end_fishing:go_fish/fish_particle_clock 1t
