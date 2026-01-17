#@s = tank with player below it positioned ~ ~-2.5 ~
#run from standard_liquids:tick

execute if score @s gm4_lt_value matches 4.. run experience add @a[distance=..0.5,limit=1,gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] 4
execute if score @s gm4_lt_value matches 4.. run scoreboard players remove @s gm4_lt_value 4

execute if score @s gm4_lt_value matches 1.. run experience add @a[distance=..0.5,limit=1,gamemode=!spectator,predicate=!gm4_standard_liquids:sneaking] 1
execute if score @s gm4_lt_value matches 1.. run scoreboard players remove @s gm4_lt_value 1

execute if score @s gm4_lt_value matches 1.. run summon experience_orb ~ ~1.8 ~ {Age:5995,Value:0}

execute as @a[distance=..0.5,limit=1,gamemode=!spectator] positioned ~ ~2.5 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function #gm4_liquid_tanks:level_report_check

execute unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update
