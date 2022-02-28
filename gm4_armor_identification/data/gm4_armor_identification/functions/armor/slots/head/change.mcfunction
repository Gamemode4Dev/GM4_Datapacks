# run from armor/slots/head/check
# @s = player wearing the armor

# apply modifications and re-equip player
item modify entity @s armor.head gm4_armor_identification:update_armor

# cleanup
scoreboard players reset $change gm4_ai_data
