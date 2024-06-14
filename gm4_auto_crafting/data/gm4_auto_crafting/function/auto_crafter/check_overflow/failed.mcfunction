# finalizes a failed operation
# @s = auto crafter that did overflow the ouput
# located at @s positioned ^ ^ ^-1
# run from gm4_auto_crafting:auto_crafter/process_output

# revert contents of the output
data modify block ~ ~-1 ~ Items set from storage gm4_auto_crafting:temp output.original

# visuals
playsound minecraft:block.fire.extinguish block @a[distance=..8] ~ ~ ~ 0.4 1.9
particle smoke ~ ~ ~ 0.1 0.1 0.1 0.05 10
