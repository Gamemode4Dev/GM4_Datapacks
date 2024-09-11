# insert lines of Lore after a specified line of Lore
# run from modules that use this library

# prepare for insert
function gm4_lore:utilities/prepare

# move all lines prior to the target line to a temp storage
# Source[0] will become equal to Target after this
function gm4_lore:utilities/find_line

# if start is specified, iterate through the lines
execute if score $start gm4_lore matches ..-1 run function gm4_lore:utilities/start_before
execute if score $start gm4_lore matches 1.. run function gm4_lore:utilities/start_after

# insert lore
execute unless score $index gm4_lore matches 0 run function gm4_lore:utilities/insert/insert_after
execute unless score $index gm4_lore matches -1 run data modify storage gm4_lore:temp TempSource append from storage gm4_lore:temp Input[]

# store the input lines
data modify storage gm4_lore:temp Dump set from storage gm4_lore:temp Input

# place the lines back into Source from the TempSource
data modify storage gm4_lore:temp Source prepend from storage gm4_lore:temp TempSource[]

# clean up
function gm4_lore:utilities/clean_up
