
data modify entity @s HandItems[0] set from storage gm4_disassemblers:temp Items[0]
execute store result score $damage gm4_disassembler run data get storage gm4_disassemblers:temp Items[0].tag.Damage
function #gm4_disassemblers:check_recipe
