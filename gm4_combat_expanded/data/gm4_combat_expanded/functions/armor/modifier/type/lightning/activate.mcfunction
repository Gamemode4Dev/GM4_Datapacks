# actiavate lightning armor on wearer getting hit
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/lightning

execute on attacker run scoreboard players add @s gm4_ce_lightning_charge 1
execute on attacker run scoreboard players set @s gm4_ce_lightning_charge.timer 80

# lightning processing is run through the weapon modifier
