execute as @e[type=minecart] at @s if block ~ ~ ~ ladder run tag @s add GM4_cart
execute as @e[type=chest_minecart] at @s if block ~ ~ ~ ladder run tag @s add GM4_cart
execute as @e[type=hopper_minecart] at @s if block ~ ~ ~ ladder run tag @s add GM4_cart
execute as @e[type=furnace_minecart] at @s if block ~ ~ ~ ladder run tag @s add GM4_cart
execute as @e[type=spawner_minecart] at @s if block ~ ~ ~ ladder run tag @s add GM4_cart
execute as @e[type=tnt_minecart] at @s if block ~ ~ ~ ladder run tag @s add GM4_cart

execute as @e[tag=GM4_cart] at @s unless block ~ ~ ~ ladder run tag @s remove GM4_cart

execute at @e[type=minecart,tag=GM4_cart] as @a[distance=..0.37,gamemode=!spectator] unless entity @s[advancements={gm4:vertical_rails=true}] run advancement grant @s only gm4:vertical_rails
