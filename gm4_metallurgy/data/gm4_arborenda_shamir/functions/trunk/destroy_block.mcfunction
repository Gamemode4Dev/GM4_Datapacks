# Destroys the block at a trunks location and kills the marker.
# @s = trunk marker
# at @s
# run from gm4_arborenda_shamir:trunk/destroy_sequenced

execute if block ~ ~ ~ #gm4_arborenda_shamir:trunks run setblock ~ ~ ~ air destroy
kill @s
