#checks for slab on top
#called from main

execute as @s run fill ~ ~ ~ ~ ~ ~ minecraft:air destroy
summon item ~ ~ ~ {Tags:["gm4_fireflies_dropped"],Item:{id:"minecraft:glass_bottle", Count:1b, tag:{gm4_fireflies:1b, display:{Name: "{\"text\":\"FireFlies\",\"color\":\"gold\"}", Lore:['"§2Throw to place a"', '"§2jar with fireflies!"', '"§5[RANGE]: 30x30"']}}}}
kill @s
