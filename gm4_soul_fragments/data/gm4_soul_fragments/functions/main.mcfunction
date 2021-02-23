# players that just respawned
execute as @e[type=player,scores={gm4_sf_rspwn=1..}] at @s run function gm4_soul_fragments:player/revived

# manage players
execute as @a[gamemode=!spectator] at @s run function gm4_soul_fragments:player/submain

# manage soul fragments
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_soul_fragment] at @s run function gm4_soul_fragments:soul_fragment/process_check

schedule function gm4_soul_fragments:main 16t
