# Destroys the block at a trunks location and kills the marker.
# @s = trunk marker
# at @s
# run from gm4_arborenda_shamir:trunk/destroy_sequenced

setblock ~ ~ ~ air destroy
kill @s
