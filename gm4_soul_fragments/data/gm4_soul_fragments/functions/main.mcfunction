#runs stuff on death/respawn
execute as @a[scores={gm4_sf_died=1..}] at @s run function gm4_soul_fragments:player/died
execute as @e[type=player,scores={gm4_sf_rspwn=1..}] at @s run function gm4_soul_fragments:player/revived

#searches for soul fragments near players who lost them and manages regeneration
execute as @a[scores={gm4_sf_fragments=1..}] unless score @s gm4_sf_rspwn matches 1 at @s run function gm4_soul_fragments:player/search_fragment

#manage abandoned soul fragments
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/sustain

schedule function gm4_soul_fragments:main 16t
