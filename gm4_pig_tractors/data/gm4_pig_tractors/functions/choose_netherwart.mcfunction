# @s = pig tractor above soul_sand with air above
# at @s
# Called from has_hoe

execute if entity @s[nbt={SelectedItem:{id:"minecraft:nether_wart"}}] run function gm4_pig_tractors:place_crops/nether_wart
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:nether_wart",Slot:-106b}]}] run function gm4_pig_tractors:place_crops/nether_wart
execute if block ~ ~ ~ air if entity @s[nbt={Inventory:[{id:"minecraft:nether_wart"}]}] run function gm4_pig_tractors:place_crops/nether_wart
