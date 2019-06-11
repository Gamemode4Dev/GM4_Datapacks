#@s = tank with player below it positioned ~ ~-2 ~
#run from standard_liquids:tick


execute if score @s gm4_lt_value matches 5.. run experience add @a[distance=..0.5,limit=1,gamemode=!spectator] 4
execute if score @s gm4_lt_value matches 5.. run scoreboard players remove @s gm4_lt_value 4

execute if score @s gm4_lt_value matches 1.. run experience add @a[distance=..0.5,limit=1,gamemode=!spectator] 1
execute if score @s gm4_lt_value matches 1.. run scoreboard players remove @s gm4_lt_value 1

execute if score @s gm4_lt_value matches 1.. run summon experience_orb ~ ~1.8 ~ {Age:5995,Value:0}
