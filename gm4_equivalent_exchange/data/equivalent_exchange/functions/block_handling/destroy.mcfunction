#@s = @e[type=armor_stand,tag=gm4_alchemical_crafter] at @s unless block ~ ~ ~ dropper
#Run from main

summon item ~ ~.6 ~ {Item:{id:"redstone",Count:1b},Passengers:[{id:"item",Item:{id:"cobblestone",Count:7}},{id:"item",Item:{id:"crafting_table",Count:1,tag:{display:{Lore:["Slightly damaged workbench"]}}}},{id:"item",Item:{id:"lapis_block",Count:4}},{id:"item",Item:{id:"blaze_powder",Count:4}},{id:"minecraft:item",Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_transmutation_stone:1b,SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}},display:{Lore:["§7Charge: §c0%§r"],Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"},gm4_transmutation_charge:0b,gm4_transmutation_charged:0b}}}]}
particle block redstone_block ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
