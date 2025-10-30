# stores mainhand item data
# @s = player who right clicked on interaction holding a supported item
# at @s
# run from mechanics/interactions/placement/interact_rcd

scoreboard players set $mainhand gm4_llp.data 1

data modify storage gm4_llp:temp DisplayType set from entity @s SelectedItem.id

execute if items entity @s weapon.mainhand #gm4_lively_lily_pads:coral_fan run \
  scoreboard players set $item_type gm4_llp.data 1
execute if items entity @s weapon.mainhand #gm4_lively_lily_pads:dead_coral_fan run \
  scoreboard players set $item_type gm4_llp.data 2
execute if items entity @s weapon.mainhand minecraft:torch run \
  scoreboard players set $item_type gm4_llp.data 3
execute if items entity @s weapon.mainhand minecraft:lantern run \
  scoreboard players set $item_type gm4_llp.data 4
execute if items entity @s weapon.mainhand minecraft:soul_torch run \
  scoreboard players set $item_type gm4_llp.data 5
execute if items entity @s weapon.mainhand minecraft:soul_lantern run \
  scoreboard players set $item_type gm4_llp.data 6
execute if items entity @s weapon.mainhand #minecraft:candles run \
  scoreboard players set $item_type gm4_llp.data 7
execute if items entity @s weapon.mainhand minecraft:cactus_flower run \
  scoreboard players set $item_type gm4_llp.data 8
execute if items entity @s weapon.mainhand minecraft:redstone_torch run \
  scoreboard players set $item_type gm4_llp.data 9
execute if items entity @s weapon.mainhand minecraft:spore_blossom run \
  scoreboard players set $item_type gm4_llp.data 10
