# Checks whether the trunk block should be destroyed.
# @s = trunk marker with depth score
# at @s
# run from gm4_arborenda_shamir:trunk/destroy_sequenced

# destroy this trunk if depth is negative
execute if score @s gm4_arb_depth matches ..0 at @s run function gm4_arborenda_shamir:trunk/destroy_block

# reschedule gm4_arborenda_shamir:trunk/destroy_sequenced
schedule function gm4_arborenda_shamir:trunk/destroy_sequenced 1t
