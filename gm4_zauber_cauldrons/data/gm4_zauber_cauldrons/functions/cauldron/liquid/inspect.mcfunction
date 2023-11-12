# Inspects and maintains a custom liquid in a Zauber Cauldron.
# @s = zauber cauldron
# at @s align xyz
# run from cauldron/structure/analyze/liquid

# Make sure current level matches last recorded level of custom liquid.
# This is required as rain or dripstones can fill custom liquid cauldrons, plus
# actively tracking the level of the custom liquid is useful to remove degeneracy
# within the advancement logic for filling/emptying a cauldron with custom liquid
# with bottles/buckets. The gm4_zc_liquid_level score is actively maintained
# whenever custom liquid is added or removed.
# Forcefully set the cauldron to the level last recorded. Rain or a dripstone may have
# filled the cauldron.

# manage visual liquid level
function gm4_zauber_cauldrons:cauldron/liquid/level/update

# remember custom liquid was found
scoreboard players set $has_liquid gm4_zc_data 1
scoreboard players set $has_magicol gm4_zc_data 1
