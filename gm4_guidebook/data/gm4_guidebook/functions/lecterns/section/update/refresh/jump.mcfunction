# updates the book
# @s = player who last opened the lectern
# located at the center of the lectern
# run from gm4_guidebook:lecterns/section/update/refresh/find_player

# get guide score
execute store result score $trigger gm4_guide run data get block ~ ~ ~ Book.tag.gm4_guidebook.trigger

# jump to section
# execute if score $trigger gm4_guide matches 1 run loot spawn ~ ~-3000 ~ loot gm4_guidebook:lectern/guidebook
# execute unless score $trigger gm4_guide matches 1 run function #gm4_guidebook:update_lectern
function #gm4_guidebook:update_lectern
execute positioned ~ ~-3000 ~ run data modify block ~ ~3000 ~ Book.tag set from entity @e[type=item,distance=..1,nbt={Item:{tag:{gm4_guidebook:{lectern:1b}}}},limit=1] Item.tag
execute positioned ~ ~-3000 ~ run kill @e[type=item,distance=..1,nbt={Item:{tag:{gm4_guidebook:{lectern:1b}}}},limit=1]

# update page number
data modify block ~ ~ ~ Page set value 5
