# process spell tridents (16t)
# @s = spell trident
# at @s
# run from spell_trident/clock

tag @s[tag=!gm4_hy_spell_trident.landed,nbt={inGround:1b}] add gm4_hy_spell_trident.landed

# process different spells
execute if entity @s[tag=gm4_hy_spell_trident.builder,tag=gm4_hy_spell_trident.landed] run function gm4_hydromancy:spell_trident/builder/cast
execute if entity @s[tag=gm4_hy_spell_trident.heal,tag=gm4_hy_spell_trident.landed] run function gm4_hydromancy:spell_trident/heal/process
execute if entity @s[tag=gm4_hy_spell_trident.ride] run function gm4_hydromancy:spell_trident/ride/process
