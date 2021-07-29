# targets NoAI piglins 50 ticks after lightning strike
# @s = server, scheduled function
# scheduled from gm4_chairs:lightning/tag

execute as @e[type=zombified_piglin,nbt={NoAI:1b}] unless data entity @s Tags at @s positioned ~ ~0.4 ~ run function gm4_chairs:lightning/revive_chair
