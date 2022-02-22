# run from player/process
# @s = player wearing armor with modifiers

# store armor items to shulker box
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet

# process identified armor
execute if data block 29999998 1 7134 Items[{Slot:0b}].tag.gm4_armor_identification.modifier run function gm4_armor_identification:armor/slots/head/check
execute if data block 29999998 1 7134 Items[{Slot:1b}].tag.gm4_armor_identification.modifier run function gm4_armor_identification:armor/slots/chest/check
execute if data block 29999998 1 7134 Items[{Slot:2b}].tag.gm4_armor_identification.modifier run function gm4_armor_identification:armor/slots/legs/check
execute if data block 29999998 1 7134 Items[{Slot:3b}].tag.gm4_armor_identification.modifier run function gm4_armor_identification:armor/slots/feet/check

# process unidentified armor
execute if data block 29999998 1 7134 Items[{Slot:0b}].tag.gm4_armor_identification.unidentified run function gm4_armor_identification:armor/slots/head/identify
execute if data block 29999998 1 7134 Items[{Slot:1b}].tag.gm4_armor_identification.unidentified run function gm4_armor_identification:armor/slots/chest/identify
execute if data block 29999998 1 7134 Items[{Slot:2b}].tag.gm4_armor_identification.unidentified run function gm4_armor_identification:armor/slots/legs/identify
execute if data block 29999998 1 7134 Items[{Slot:3b}].tag.gm4_armor_identification.unidentified run function gm4_armor_identification:armor/slots/feet/identify
