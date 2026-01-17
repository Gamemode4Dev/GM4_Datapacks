#@s liquid minecart display of a minecart that has 0 liquid in it
#run from unload_liquid or init_tank or drain_minecart

data modify entity @s item.components."minecraft:custom_data".gm4_liquid_minecarts.liquid_tag set value "empty"
data modify entity @s item.components."minecraft:custom_data".gm4_liquid_minecarts.tank set value {texture:"null",CustomName:"null"}
