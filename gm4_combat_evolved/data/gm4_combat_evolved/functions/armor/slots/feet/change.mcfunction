# run from armor/slots/feet/check
# @s = player wearing the armor

# apply modifications and re-equip player
item modify entity @s armor.feet gm4_combat_evolved:update

# cleanup
scoreboard players reset $change gm4_ce_data
