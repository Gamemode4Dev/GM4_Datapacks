execute as @e[type=minecart] at @s if block ~ ~ ~ ladder run tag @s add gm4_minecart
execute as @e[type=chest_minecart] at @s if block ~ ~ ~ ladder run tag @s add gm4_minecart
execute as @e[type=hopper_minecart] at @s if block ~ ~ ~ ladder run tag @s add gm4_minecart
execute as @e[type=furnace_minecart] at @s if block ~ ~ ~ ladder run tag @s add gm4_minecart
execute as @e[type=spawner_minecart] at @s if block ~ ~ ~ ladder run tag @s add gm4_minecart
execute as @e[type=tnt_minecart] at @s if block ~ ~ ~ ladder run tag @s add gm4_minecart

execute at @e[type=minecart] if block ~ ~ ~ ladder as @a[distance=..0.37,gamemode=!spectator] run advancement grant @s only gm4:vertical_rails
