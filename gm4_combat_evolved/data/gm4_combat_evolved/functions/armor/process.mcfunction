# store armor information in storage and process them
# @s = player wearing armor with modifiers
# run from player/process

# store armor items to storage
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_evolved:temp Items set from block 29999998 1 7134 Items

# process identified armor
execute if data storage gm4_combat_evolved:temp Items[{Slot:0b}].tag.gm4_combat_evolved.modifier run function gm4_combat_evolved:armor/slots/head/check
execute if data storage gm4_combat_evolved:temp Items[{Slot:1b}].tag.gm4_combat_evolved.modifier run function gm4_combat_evolved:armor/slots/chest/check
execute if data storage gm4_combat_evolved:temp Items[{Slot:2b}].tag.gm4_combat_evolved.modifier run function gm4_combat_evolved:armor/slots/legs/check
execute if data storage gm4_combat_evolved:temp Items[{Slot:3b}].tag.gm4_combat_evolved.modifier run function gm4_combat_evolved:armor/slots/feet/check

# process unidentified armor
execute if data storage gm4_combat_evolved:temp Items[{Slot:0b}].tag.gm4_combat_evolved.unidentified run function gm4_combat_evolved:armor/slots/head/identify
execute if data storage gm4_combat_evolved:temp Items[{Slot:1b}].tag.gm4_combat_evolved.unidentified run function gm4_combat_evolved:armor/slots/chest/identify
execute if data storage gm4_combat_evolved:temp Items[{Slot:2b}].tag.gm4_combat_evolved.unidentified run function gm4_combat_evolved:armor/slots/legs/identify
execute if data storage gm4_combat_evolved:temp Items[{Slot:3b}].tag.gm4_combat_evolved.unidentified run function gm4_combat_evolved:armor/slots/feet/identify
