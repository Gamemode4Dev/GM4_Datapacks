#@s = @e[type=armor_stand,tag=gm4_pulverizer] at @s unless block ~ ~ ~ dropper
#Run from main

function #pulverizers:destroy

summon area_effect_cloud ~ ~ ~ {Passengers:[{id:item,Item:{id:"cobblestone",Count:9b}},{id:item,Item:{id:"redstone",Count:1b}},{id:item,Item:{id:"crafting_table",Count:1,tag:{display:{Lore:["slightly damaged workbench"]}}}},{id:item,Item:{id:"iron_block",Count:4b}},{id:item,Item:{id:"coal_block",Count:1b}},{id:item,Item:{id:"minecraft:comparator",Count:2b}},{id:item,Item:{id:"minecraft:iron_pickaxe",Count:1b,tag:{Damage:250s}}},{id:item,Item:{id:"minecraft:furnace",Count:1b}},{id:item,Item:{id:"piston",Count:5b}},{id:item,Item:{id:"redstone_block",Count:1b}}]}
kill @s
