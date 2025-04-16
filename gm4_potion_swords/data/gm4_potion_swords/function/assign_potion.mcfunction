#@s = @a[score={gm4_gold_sword=1..}]
tag @s add gm4_gold_user
execute if predicate gm4_potion_swords:holding/strong_healing at @s anchored eyes positioned ^ ^ ^2 run effect give @a[distance=..2.5,tag=!gm4_gold_user] absorption 8 1
execute if predicate gm4_potion_swords:holding/strong_poison at @s anchored eyes positioned ^ ^ ^2 run function gm4_potion_swords:wither_potion
execute if predicate gm4_potion_swords:holding/long_invisibility at @s anchored eyes positioned ^ ^ ^2 run effect give @a[distance=..2.5,tag=!gm4_gold_user] invisibility 8 0
execute if predicate gm4_potion_swords:holding/long_slowness at @s anchored eyes positioned ^ ^ ^2 run effect give @e[distance=..2.5,tag=!smithed.strict,tag=!gm4_gold_user] slowness 4 10
tag @s remove gm4_gold_user
scoreboard players reset @a[scores={gm4_gold_sword=1..}] gm4_gold_sword
