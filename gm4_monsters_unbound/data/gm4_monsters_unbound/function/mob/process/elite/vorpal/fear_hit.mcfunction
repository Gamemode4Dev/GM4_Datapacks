# apply fear to hit player
# @s = player that was hit
# at @s
# run from mob/process/elite/vorpal/process_fear_cloud

scoreboard players set $player_hit gm4_mu_data 1

scoreboard players set $fear_seconds gm4_mu_data 5
function gm4_monsters_unbound:effect/fear/apply
