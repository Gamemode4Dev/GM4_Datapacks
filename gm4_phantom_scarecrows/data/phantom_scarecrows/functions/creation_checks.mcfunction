# @s = @e[type=armor_stand,tag=!gm4_phantom_scarecrow,distance=..5] within 5 blocks of a player
# at world spawn
# ran from main

#check for curses
execute if entity @s[nbt={ArmorItems:[{},{},{tag:{Enchantments:[{id:"minecraft:binding_curse"}]}},{}]}] run function phantom_scarecrows:create
#check for second curse (tag check included to exclude any armor stands that already succeeded the first curse check)
execute if entity @s[tag=!gm4_phantom_scarecrow,nbt={ArmorItems:[{},{},{tag:{Enchantments:[{id:"minecraft:vanishing_curse"}]}},{}]}] run function phantom_scarecrows:create
