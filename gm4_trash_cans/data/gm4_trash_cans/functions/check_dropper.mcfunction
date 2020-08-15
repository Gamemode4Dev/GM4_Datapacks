# @s = trash_can
# run from update

# Visuals
data merge entity @s {CustomName:'"gm4_trash_can"',ArmorItems:[{},{},{},{id:"minecraft:magma_block",Count:1b,tag:{CustomModelData:1}}]}

# Disable Trash Can
tag @s[tag=gm4_trash_disabled] remove gm4_trash_disabled
function gm4_trash_cans:disable/wet
function gm4_trash_cans:disable/blacklist

# Visuals
execute unless entity @s[tag=gm4_trash_disabled] run particle flame ~ ~1.1 ~ 0 0 0 0.01 1
execute if block ~ ~ ~ dropper[triggered=true] run particle dust 1 0 0 1 ~ ~1.1 ~ 0 0 0 0.05 1

# Check the rate of deletion
execute unless entity @s[tag=gm4_trash_disabled] if data block ~ ~ ~ Items[0].Count run function gm4_trash_cans:check_rate