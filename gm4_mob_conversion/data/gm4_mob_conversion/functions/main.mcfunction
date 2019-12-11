#execute on red mushrooms to check for cows around them
execute at @e[type=item,nbt={Item:{id:"minecraft:red_mushroom"}},limit=1,sort=random] if entity @e[type=item,distance=..1.5,limit=1,nbt={Item:{id:"minecraft:brown_mushroom"}}] as @e[type=cow,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:2b}]}] at @s run function gm4_mob_conversion:convert_cow
execute at @e[type=item,nbt={Item:{id:"minecraft:golden_carrot"}},limit=1,sort=random] as @e[type=zombie_pigman,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:1b}]}] at @s run function gm4_mob_conversion:convert_pigman
execute at @e[type=item,nbt={Item:{id:"minecraft:golden_apple"}},limit=1,sort=random] as @e[type=witch,distance=..1.5,limit=1,nbt={ActiveEffects:[{Id:18b}]}] at @s run function gm4_mob_conversion:convert_witch

schedule function gm4_mob_conversion:main 16t
