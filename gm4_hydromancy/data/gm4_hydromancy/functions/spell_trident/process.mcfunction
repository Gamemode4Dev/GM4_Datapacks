# process spell tridents (1t)
# @s = spell trident
# at @s
# run from spell_trident/clock

tag @s[tag=!gm4_hy_spell_trident.landed,nbt={inGround:1b}] add gm4_hy_spell_trident.landed

# process different spells
execute if entity @s[tag=gm4_hy_spell_trident.firework] run function gm4_hydromancy:spell_trident/firework/process
execute if entity @s[tag=gm4_hy_spell_trident.hopper] run function gm4_hydromancy:spell_trident/hopper/process
execute if entity @s[tag=gm4_hy_spell_trident.ride] run function gm4_hydromancy:spell_trident/ride/process
execute if entity @s[tag=gm4_hy_spell_trident.builder] run function gm4_hydromancy:spell_trident/builder/process
execute if entity @s[tag=gm4_hy_spell_trident.heal,tag=gm4_hy_spell_trident.landed] run function gm4_hydromancy:spell_trident/heal/process
execute if entity @s[tag=gm4_hy_spell_trident.thunder] run function gm4_hydromancy:spell_trident/thunder/process
execute if entity @s[tag=gm4_hy_spell_trident.frost,tag=gm4_hy_spell_trident.landed] positioned ~ ~1 ~ run function gm4_hydromancy:spell_trident/frost/cast
