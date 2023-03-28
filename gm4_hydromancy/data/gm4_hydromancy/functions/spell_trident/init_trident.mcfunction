# initialize a newly throw spell trident with mana
# @s = spell trident
# at @s
# run from spell_trident/thrown

# activate trident tracking
execute unless entity @e[type=trident,tag=gm4_hy_spell_trident] run schedule function gm4_hydromancy:spell_trident/clock 1t
tag @s add gm4_hy_spell_trident.process

# replace throw sound
playsound block.conduit.attack.target player @a[distance=..16] ~ ~ ~ 1 1.75
playsound item.trident.riptide_1 player @a[distance=..16] ~ ~ ~ 0.5 0.65

# Activate spell
execute store result score $spell_id gm4_hy_data run data get entity @s Trident.tag.gm4_hy_spell_trident.spell_id
# [Surge Surf] owner rides trident, dismounting stops trident momentum, each tick of riding costs mana
execute if score $spell_id gm4_hy_data matches 1 run function gm4_hydromancy:spell_trident/ride/initialize
# [Healing Spring] around landing grow crops, regrow coral, regen entities (damage undead), breed mobs.
#   Can be picked up only after right click (interaction entity), each action costs mana
execute if score $spell_id gm4_hy_data matches 2
# [Whirlpool] nearby items ride trident, when landed returns to owner (loyalty?), each item costs mana
execute if score $spell_id gm4_hy_data matches 3
# [Hydrokinetics] disable gravity and deal drowing damage to nearby living/undead entities.
#   Instantly returns to owner after some time, instant mana cost on cast
execute if score $spell_id gm4_hy_data matches 4
# [Aquatecture] builders wand, instant mana cost on cast
execute if score $spell_id gm4_hy_data matches 5

# TODO: remove
#data modify entity @s SoundEvent set value "item.trident.thunder"
