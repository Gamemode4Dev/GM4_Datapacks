#run from cables/unspool_string_[direction]
#@s = player using the crossbow

scoreboard players add @s gm4_cb_strcount 1

#give back the string
give @s[gamemode=!creative] minecraft:string 1

