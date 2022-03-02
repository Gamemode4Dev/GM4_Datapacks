# run from armor/slots/legs/check
# @s = player wearing the armor

# apply modifications and re-equip player
item modify entity @s armor.legs gm4_combat_evolved:update_armor

# cleanup
scoreboard players reset $change gm4_ce_data
