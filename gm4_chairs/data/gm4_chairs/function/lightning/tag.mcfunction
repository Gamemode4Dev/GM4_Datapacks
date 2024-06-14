# Target NoAI zombified_piglin after lightning strike near player
# @s = player
# at @s
# runs from advancement, gm4_chairs:lightning

advancement revoke @s only gm4_chairs:lightning

execute as @e[type=zombified_piglin,nbt={NoAI:1b}] unless data entity @s Tags at @s if block ~ ~1 ~ #minecraft:stairs run function gm4_chairs:lightning/revive_chair
