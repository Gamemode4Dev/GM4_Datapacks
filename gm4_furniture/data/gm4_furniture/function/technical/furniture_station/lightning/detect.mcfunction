# Target NoAI witch after lightning strike near player
# @s = player
# at @s
advancement revoke @s only gm4_furniture:lightning

execute as @e[type=witch,nbt={NoAI:1b}] unless data entity @s Tags at @s if block ~ ~ ~ barrier run function gm4_furniture:technical/furniture_station/lightning/revive_villager
