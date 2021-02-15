# runs stuff on respawn
execute as @e[type=player,scores={gm4_sf_rspwn=1..}] at @s run function gm4_soul_fragments:player/revived

# manage players
execute as @a[gamemode=!spectator] run function gm4_soul_fragments:player/submain

# manage abandoned soul fragments
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/process_check

# angry soul fragment stuff
execute as @e[type=minecraft:vex,tag=gm4_angry_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/angry_fragment

# soul tracker
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_sf_soul_tracker] at @s unless entity @e[type=vex,tag=gm4_angry_soul_fragment,distance=..1] run function gm4_soul_fragments:spawn_fragment

# soul in a totem on the ground
execute as @e[type=item,nbt={Item:{id:"minecraft:totem_of_undying",tag:{gm4_soul_fragments:{}},Count:1b},OnGround:1b}] at @s run function gm4_soul_fragments:totem/release_fragment

schedule function gm4_soul_fragments:main 16t
