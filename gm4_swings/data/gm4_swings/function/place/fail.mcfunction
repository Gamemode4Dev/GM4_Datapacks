# Drop a swing item and destroy the swing placement player head
# @s = Player, placing a swing
# at swing placement player head
# run from gm4_swings:place/check
# with $components = Components from the swing placement player head

$loot spawn ~ ~ ~ loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:player_head",modifier:[{type:"minecraft:set_components",components:$(components)},{type:"minecraft:set_components",components:{"minecraft:profile":{texture:"gm4_swings:block/transparent_head"},"!minecraft:equippable":{}}}]}]}]}
setblock ~ ~ ~ minecraft:air
