#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#experience tank
execute if entity @s[tag=gm4_lt_experience] if items block ~ ~ ~ container.0 *[minecraft:enchantments~[{enchantments:["minecraft:mending"]}]] run function gm4_mending_tanks:check_item
