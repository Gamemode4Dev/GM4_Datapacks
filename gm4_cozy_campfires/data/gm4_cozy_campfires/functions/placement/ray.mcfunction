# run from placement/place and placement/ray

scoreboard players add ray_step gm4_count 1
execute store success score success gm4_count if block ~ ~ ~ #minecraft:campfires unless entity @e[type=marker,tag=gm4_campfire,dx=0] align xyz run summon marker ~0.5 ~0.5 ~0.5 {CustomName:'"gm4_campfire"',Tags:["gm4_campfire"]}
execute if score ray_step gm4_count matches 0..500 if score success gm4_count matches 0 positioned ^ ^ ^0.01 run function gm4_cozy_campfires:placement/ray
