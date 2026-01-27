# @s = none
# run from update_tags/check_pneuma

execute unless entity @a[tag=gm4_pneuma_debilitate,limit=1] run return 0
execute unless entity @a[gamemode=!spectator,tag=gm4_pneuma_debilitate,scores={gm4_oa_bow_debilitate=1..},limit=1] run return run schedule function gm4_orb_of_ankou:pneumas/temp_tick/debilitate 1t
execute as @a[gamemode=!spectator,tag=gm4_pneuma_debilitate,scores={gm4_oa_bow_debilitate=1..}] at @s anchored eyes positioned ^ ^ ^2 run tag @e[type=arrow,distance=..2.5,limit=1] add gm4_oa_arrow
data merge entity @e[type=arrow,tag=gm4_oa_arrow,limit=1] {item: {components: {"minecraft:potion_contents": {custom_effects: [{duration: 600, show_icon: 1b, id: "minecraft:weakness"}]}}}}
tag @e[type=arrow] remove gm4_oa_arrow

scoreboard players reset @a gm4_oa_bow_debilitate
schedule function gm4_orb_of_ankou:pneumas/temp_tick/debilitate 1t
