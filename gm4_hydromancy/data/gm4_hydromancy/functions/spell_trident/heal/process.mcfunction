# process landed spell trident
# @s = spell trident
# at @s
# run from spell_trident/process

# on first landing setup trident
execute if entity @s[tag=!gm4_hy_spell_trident.heal.initiated] run function gm4_hydromancy:spell_trident/heal/landed

# apply spell effects every 10 ticks, or 50 ticks if out of mana
scoreboard players add @s gm4_hy_duration 1
execute if score @s gm4_hy_mana_used < @s gm4_hy_charge run scoreboard players add @s gm4_hy_duration 4

# vfx
scoreboard players set $heal.particle_ring gm4_hy_data 36
execute if score @s gm4_hy_duration matches 5 positioned ~ ~0.165 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 10 positioned ~ ~0.33 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 15 positioned ~ ~0.495 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 20 positioned ~ ~0.66 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 25 positioned ~ ~0.825 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 30 positioned ~ ~0.99 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 35 positioned ~ ~1.155 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 40 positioned ~ ~1.32 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 45 positioned ~ ~1.485 ~ run function gm4_hydromancy:spell_trident/heal/vfx_ring
execute if score @s gm4_hy_duration matches 50.. run function gm4_hydromancy:spell_trident/heal/spell_apply

# if interaction entity is lost or has been touched stop spell
execute store success score $heal.keep_active gm4_hy_data unless data entity @e[type=interaction,tag=gm4_hy_heal.interact,distance=..0.06,limit=1,sort=nearest] interaction.player
execute if score $heal.keep_active gm4_hy_data matches 0 run function gm4_hydromancy:spell_trident/heal/stop
