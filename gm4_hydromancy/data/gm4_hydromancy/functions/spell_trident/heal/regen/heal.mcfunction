# heal living entities
# @s = targeted entity
# at spell trident
# run from spell_trident/heal/regen/check_type

scoreboard players add $heal.mana_used gm4_hy_data 1
effect give @s[type=!#gm4_hydromancy:undead] regeneration 4 0
