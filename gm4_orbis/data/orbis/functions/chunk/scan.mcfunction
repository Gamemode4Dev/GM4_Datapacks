loot spawn ~ ~ ~ loot orbis:detect_biome
execute store result score @s gm4_orbis_biome run data get entity @e[type=item,distance=..1,limit=1] Item.tag.gm4_orbis.biome
kill @e[type=item,distance=..1,limit=1]
