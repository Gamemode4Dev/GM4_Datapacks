# runs stuff on respawn
execute as @e[type=player,scores={gm4_sf_rspwn=1..}] at @s run function gm4_soul_fragments:player/revived

# manages regeneration
execute as @a[scores={gm4_sf_fragments=1..}] unless score @s gm4_sf_rspwn matches 1 at @s run function gm4_soul_fragments:player/manage_regen

# manage abandoned soul fragments
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/sustain

schedule function gm4_soul_fragments:main 16t
