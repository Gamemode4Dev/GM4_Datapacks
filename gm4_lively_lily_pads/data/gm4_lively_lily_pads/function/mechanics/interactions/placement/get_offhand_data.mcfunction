# stores offhand item data
# @s = player who right clicked on interaction holding a supported item
# at @s
# run from mechanics/interactions/placement/interact_rcd

scoreboard players set $offhand gm4_llp.data 1

data modify storage gm4_llp:temp DisplayType set from entity @s equipment.offhand.id

execute if items entity @s weapon.offhand #gm4_lively_lily_pads:coral_fan run \
  scoreboard players set $item_type gm4_llp.data 1
execute if items entity @s weapon.offhand #gm4_lively_lily_pads:dead_coral_fan run \
  scoreboard players set $item_type gm4_llp.data 2
execute if items entity @s weapon.offhand minecraft:torch run \
  scoreboard players set $item_type gm4_llp.data 3
execute if items entity @s weapon.offhand minecraft:lantern run \
  scoreboard players set $item_type gm4_llp.data 4
execute if items entity @s weapon.offhand minecraft:soul_torch run \
  scoreboard players set $item_type gm4_llp.data 5
execute if items entity @s weapon.offhand minecraft:soul_lantern run \
  scoreboard players set $item_type gm4_llp.data 6
execute if items entity @s weapon.offhand #minecraft:candles run \
  scoreboard players set $item_type gm4_llp.data 7
execute if items entity @s weapon.offhand minecraft:cactus_flower run \
  scoreboard players set $item_type gm4_llp.data 8
execute if items entity @s weapon.offhand minecraft:redstone_torch run \
  scoreboard players set $item_type gm4_llp.data 9
execute if items entity @s weapon.offhand minecraft:spore_blossom run \
  scoreboard players set $item_type gm4_llp.data 10
execute if items entity @s weapon.offhand #gm4_lively_lily_pads:copper_lanterns run \
  scoreboard players set $item_type gm4_llp.data 11
execute if items entity @s weapon.offhand #gm4_lively_lily_pads:waxed_copper_lanterns run \
  scoreboard players set $item_type gm4_llp.data 12
execute if items entity @s weapon.offhand minecraft:copper_torch run \
  scoreboard players set $item_type gm4_llp.data 13
