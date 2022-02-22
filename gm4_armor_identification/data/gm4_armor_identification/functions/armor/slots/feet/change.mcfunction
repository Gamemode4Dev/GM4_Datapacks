# run from armor/slots/feet/check
# @s = player wearing the armor

# apply modifications and re-equip player
data modify block 29999998 1 7134 Items[{Slot:3b}].tag set from storage gm4_armor_identification:temp tag
item replace entity @s armor.feet from block 29999998 1 7134 container.3

# cleanup
scoreboard players reset $change gm4_ai_data
