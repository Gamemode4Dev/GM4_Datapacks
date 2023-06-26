# store armor information in storage and process them
# @s = player wearing armor with modifiers
# at world spawn
# run from player/process

# store armor items to storage
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items

# process unidentified armor
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded{identified:0} run function gm4_combat_expanded:armor/slot/head/identify
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded{identified:0} run function gm4_combat_expanded:armor/slot/chest/identify
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded{identified:0} run function gm4_combat_expanded:armor/slot/legs/identify
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded{identified:0} run function gm4_combat_expanded:armor/slot/feet/identify

# process identified armor
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded.modifier run function gm4_combat_expanded:armor/slot/head/check
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded.modifier run function gm4_combat_expanded:armor/slot/chest/check
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded.modifier run function gm4_combat_expanded:armor/slot/legs/check
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded.modifier run function gm4_combat_expanded:armor/slot/feet/check
