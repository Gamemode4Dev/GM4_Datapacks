# replaces the lectern with a new book
# @s = player that triggers gm4_guide
# located at center of the lectern
# run from gm4_guidebook:update_book/ray

scoreboard players set $found gm4_guide 1

# summon book entity
execute if score @s gm4_guide matches 1 run loot spawn ~ ~-3000 ~ loot gm4_guidebook:_guidebook
function #gm4_guidebook:update_lectern

# replace book in lectern
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.tag set from entity @e[type=item,distance=..1,nbt={Item:{tag:{gm4_guidebook:1b}}},limit=1] Item.tag
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,nbt={Item:{tag:{gm4_guidebook:1b}}},limit=1]
data remove storage gm4_guidebook:temp pages
