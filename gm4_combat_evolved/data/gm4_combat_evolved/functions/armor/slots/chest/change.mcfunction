# run from armor/slots/chest/check
# @s = player wearing the armor

# apply modifications and re-equip player
item modify entity @s armor.chest gm4_combat_evolved:update

# cleanup
scoreboard players reset $change gm4_ce_data
