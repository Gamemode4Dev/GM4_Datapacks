# place interaction logic
# @s = player who right clicked on interaction holding a supported item
# at @s
# run from advancement: placement_rcd

advancement revoke @s only gm4_lively_lily_pads:placement_rcd

# brief check to enable Upgrade_Path 3.0
execute if entity @e[type=minecraft:interaction,tag=lilyPadInt,limit=1,distance=..64] run scoreboard players set lively_lily_pads gm4_earliest_version 0

# gamemode flags
execute if entity @s[gamemode=adventure] run scoreboard players set $adventure gm4_llp.data 1

# item information
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

# store item id
data modify storage gm4_llp:temp DisplayType set from entity @s SelectedItem.id

# process interaction
execute as @e[type=interaction,tag=gm4_llp_placement_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/placement/process_interaction

# minus one on player mainhand if successful
execute if entity @s[gamemode=!creative] if score $placement_success gm4_llp.data matches 1 run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
scoreboard players reset $placement_success gm4_llp.data
