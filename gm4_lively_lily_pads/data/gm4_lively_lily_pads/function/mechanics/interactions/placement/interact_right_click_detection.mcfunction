# place interaction logic
# @s = player who right clicked on interaction holding a supported item
# at @s
# run from advancement: gm4_lively_lily_pads:placement_rcd

advancement revoke @s only gm4_lively_lily_pads:placement_rcd
scoreboard players reset $minus_one gm4_llp.data

# item information
data modify storage gm4_llp:temp SelectedItem set from entity @s SelectedItem.id
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

# need to raycast for lily pad with a placement rcd on it
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 10
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/interactions/placement/ray

# minus one on player mainhand if successful
execute if entity @s[gamemode=!creative] if score $minus_one gm4_llp.data matches 1 run item modify entity @s weapon.mainhand gm4_lively_lily_pads:minus_one
