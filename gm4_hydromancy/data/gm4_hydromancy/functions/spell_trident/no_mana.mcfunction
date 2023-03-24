# fail a newly throw spell trident with no mana
# @s = spell trident
# at @s
# run from spell_trident/thrown

data modify entity @s Motion set value [0.0,0.0,0.0]
