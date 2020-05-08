#run from check_projectile
#@s = player using the crossbow

#store amount of string on the player, with max value of 40
execute store result score @s gm4_cb_strcount run clear @s minecraft:string 0
execute if score @s gm4_cb_strcount matches 40.. run scoreboard players set @s gm4_cb_strcount 40

#reset scoreboard to 0
scoreboard players set @s gm4_cb_strplace 0

#check direction if player is looking at horizon, with a tripwire hook at their feet or eye level
execute at @s[x_rotation=-15..15] if block ~ ~1.5 ~ minecraft:tripwire_hook positioned ~ ~1 ~ run function gm4_crossbow_cartridges:cables/determine_direction
execute at @s[x_rotation=-15..15] unless block ~ ~1.5 ~ minecraft:tripwire_hook if block ~ ~0.5 ~ minecraft:tripwire_hook run function gm4_crossbow_cartridges:cables/determine_direction
