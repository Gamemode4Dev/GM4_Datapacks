scoreboard players set @a[gamemode=creative] gm4_creative 0
execute as @a[gamemode=!creative] unless score @s gm4_creative matches 0.. run scoreboard players operation @s gm4_creative = $cooldown gm4_creative
scoreboard players add @a[gamemode=!creative] gm4_creative 1

execute if entity @a[gamemode=creative] run scoreboard players set $global gm4_creative 0
execute unless entity @a[gamemode=creative] run scoreboard players add $global gm4_creative 1

tag @a remove gm4_show_log
execute as @a if score @s gm4_creative < $cooldown gm4_creative run tag @s add gm4_show_log
execute if score $global gm4_creative >= $global_cooldown gm4_creative run tag @a add gm4_show_log
function gm4:log
