# detect linked player taking damage
# @s = player taking damage
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/link

# tag self and all players with the same id
scoreboard players operation $curr_id gm4_ce_link_id = @s gm4_ce_link_id
execute as @a[tag=gm4_ce_linked,gamemode=!spectator,gamemode=!creative] if score @s gm4_ce_link_id = $curr_id gm4_ce_link_id run tag @s add gm4_ce_linked.damaged

# calculate the hp for all players that need to take damage
execute as @a[tag=gm4_ce_linked.damaged] run function gm4_combat_expanded:player/calculate_hp
tag @a[tag=gm4_ce_linked.damaged,scores={gm4_ce_health.current=0}] remove gm4_ce_linked.damaged
# set link health to the damaged players new health
scoreboard players operation $link_health gm4_ce_data = @s gm4_ce_health.current

# if there is still health remaining reduce all players to that health (not self, you're already at that health)
execute if score $link_health gm4_ce_data matches 1.. as @a[tag=gm4_ce_linked.damaged,distance=0.01..] run function gm4_combat_expanded:armor/modifier/type/link/process/calc_damage

# if health reaches 0 kill linked players (not self, you're already dead)
tag @s add gm4_ce_target
execute unless score $link_health gm4_ce_data matches 1.. as @a[tag=gm4_ce_linked.damaged,distance=0.01..] run function gm4_combat_expanded:armor/modifier/type/link/process/death
tag @s remove gm4_ce_target

# stop nat regen for at least a tick
scoreboard players set @a[tag=gm4_ce_linked.damaged] gm4_ce_natural_regen_damage 1

# remove tag from damaged players
tag @a remove gm4_ce_linked.damaged
