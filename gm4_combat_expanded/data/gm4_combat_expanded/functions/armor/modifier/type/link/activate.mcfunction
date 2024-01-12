# activate link for this player
# @s = player wearing link armor
# at unspecified
# run from armor/modifier/check_modifier/equip

# if there are other linked players set max health to 40
execute if entity @a[tag=gm4_ce_linked,gamemode=!spectator,gamemode=!creative] run function gm4_combat_expanded:armor/modifier/type/link/set_max_health

# if there are not remove any max health change from this armor
execute unless entity @a[tag=gm4_ce_linked,gamemode=!spectator,gamemode=!creative] run function gm4_combat_expanded:armor/modifier/type/link/deactivate

# tag player as linked
tag @s[gamemode=!creative] add gm4_ce_linked
