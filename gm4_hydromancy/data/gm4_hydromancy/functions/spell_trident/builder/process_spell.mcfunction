
# store wall block in forceloaded chunk for checking
clone ^ ^ ^1 ^ ^ ^1 29999997 0 7130
data modify storage gm4_hydromancy:temp builder.Rotation set from entity @s Rotation
tag @s remove gm4_hy_builder.new

# fill first layer
execute positioned ^1 ^ ^ if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"]}
execute positioned ^-1 ^ ^ if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"]}
execute positioned ^ ^1 ^ if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"]}
execute positioned ^ ^-1 ^ if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"]}
execute as @e[type=marker,tag=gm4_hy_builder.new] run data modify entity @s Rotation set from storage gm4_hydromancy:temp builder.Rotation

execute as @e[type=marker,tag=gm4_hy_builder.new] at @s run function gm4_hydromancy:spell_trident/builder/process_spell
