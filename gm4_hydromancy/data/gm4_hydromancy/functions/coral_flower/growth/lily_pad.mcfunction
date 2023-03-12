# grow this lily pad
# @s = growth marker
# at @s
# run from coral_flower/growth/raycast

# mark possible growth locations
execute if block ~1 ~ ~ #gm4:air run summon marker ~1 ~ ~ {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~-1 ~ ~ #gm4:air run summon marker ~-1 ~ ~ {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~1 ~ ~1 #gm4:air run summon marker ~1 ~ ~1 {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~1 ~ ~-1 #gm4:air run summon marker ~1 ~ ~-1 {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~-1 ~ ~1 #gm4:air run summon marker ~-1 ~ ~1 {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~-1 ~ ~-1 #gm4:air run summon marker ~-1 ~ ~-1 {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~ ~ ~1 #gm4:air run summon marker ~ ~ ~1 {Tags:["gm4_hy_possible_lily_pad"]}
execute if block ~ ~ ~-1 #gm4:air run summon marker ~ ~ ~-1 {Tags:["gm4_hy_possible_lily_pad"]}

# only stop raycast if growth is possible
execute if entity @e[type=marker,tag=gm4_hy_possible_lily_pad] run scoreboard players set $raycast_limit gm4_hy_data 0

# grow lily pads depending on size of current cluster
execute store result score $lily_pad_count gm4_hy_data run clone ~-1 ~ ~-1 ~1 ~ ~1 ~-1 ~ ~-1 filtered lily_pad move
execute if score $lily_pad_count gm4_hy_data matches ..3 at @e[type=marker,tag=gm4_hy_possible_lily_pad,limit=1,sort=random] run setblock ~ ~ ~ lily_pad
execute if score $lily_pad_count gm4_hy_data matches 4..5 at @e[type=marker,tag=gm4_hy_possible_lily_pad,limit=2,sort=random] run setblock ~ ~ ~ lily_pad
execute if score $lily_pad_count gm4_hy_data matches 6.. at @e[type=marker,tag=gm4_hy_possible_lily_pad] run setblock ~ ~ ~ lily_pad
execute as @e[type=marker,tag=gm4_hy_possible_lily_pad] at @s if block ~ ~ ~ lily_pad run function gm4_hydromancy:coral_flower/growth/vfx
kill @e[type=marker,tag=gm4_hy_possible_lily_pad]
