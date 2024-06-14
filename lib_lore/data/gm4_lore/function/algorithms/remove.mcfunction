# remove a specified line of Lore from a source Lore
# run from modules that use this library

# prepare for removal
function gm4_lore:utilities/prepare

# move all lines prior to the target line to a temp storage
# Source[0] will become equal to Target after this
function gm4_lore:utilities/find_line

# if start is specified, iterate through the lines
execute if score $start gm4_lore matches ..-1 run function gm4_lore:utilities/start_before
execute if score $start gm4_lore matches 1.. run function gm4_lore:utilities/start_after

# if extra is specified, remove the rest of the extra lines
execute if score $extra gm4_lore matches 1.. run function gm4_lore:utilities/remove/extra_lines

# remove the first line of source
data modify storage gm4_lore:temp Dump append from storage gm4_lore:temp Source[0]
data remove storage gm4_lore:temp Source[0]

# if extra is -1, clear Source
execute if score $extra gm4_lore matches -1 run function gm4_lore:utilities/remove/remove_rest

# place the lines back into Source from the TempSource
data modify storage gm4_lore:temp Source prepend from storage gm4_lore:temp TempSource[]

# clean up
function gm4_lore:utilities/clean_up
