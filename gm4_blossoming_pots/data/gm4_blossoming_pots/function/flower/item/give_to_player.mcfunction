# Summons an item stack at the players feet for them to pick up
# @s = player who right clicked on custom flower pot with an empty hand
# at temp marker align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/item/remove_plant

$execute at @s run summon minecraft:item ~ ~ ~ {Item:{id:"$(id)",count:$(count)}}
