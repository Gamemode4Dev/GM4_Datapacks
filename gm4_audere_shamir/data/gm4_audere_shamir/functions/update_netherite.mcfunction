# @s = player holding a netherite audere tool that has the wrong Item.tag.gm4_audere_shamir.max_durability
# run from active_tool

# store tool in storage
data modify storage gm4_audere_shamir:temp/player/tool SelectedItem.tag.gm4_audere_shamir.max_durability set value 2031

# move tool into shulker box
data modify storage gm4_audere_shamir:temp/player/tool SelectedItem.Slot set value 0b
data remove block 29999998 1 7134 Items[]
data modify block 29999998 1 7134 Items append from storage gm4_audere_shamir:temp/player/tool SelectedItem

# replace mainhand with the proper tool
loot replace entity @s weapon.mainhand 1 mine 29999998 1 7134 minecraft:air{drop_contents:1b}
scoreboard players set $tool_max_damage gm4_ml_data 2031
