#run from cables/unspool_string_[direction]
#@s = player using the crossbow

setblock ~ ~ ~ minecraft:tripwire destroy
particle dust 1 1 1 1 ~ ~ ~ 0 0 0 1 5 normal
clear @s[gamemode=!creative] minecraft:string 1

#adjust scoreboards
scoreboard players remove @s gm4_cb_strcount 1
scoreboard players add @s gm4_cb_strplace 1

#give advancement
execute if score @s gm4_cb_strplace matches 40 run advancement grant @s only gm4:crossbow_cartridges_string

#kill arrow
execute if score @s gm4_cb_strplace matches 1 run kill @e[type=minecraft:arrow,tag=gm4_cb_arrow,distance=..2,limit=1,sort=nearest]