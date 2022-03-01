# spawns a falling star shower on a player if the right conditions have been met
# @s = players in the overworld during a falling star night
# at @s
# run from gm4_falling_stars:star_shower

# start spawn attempt if there wasn't a spawn attempt by nearby player already and have a random chance to abort
execute unless entity @s[tag=gm4_falling_stars_ignore] if predicate gm4_falling_stars:shower_chance run function gm4_falling_stars:falling_star/select_spawn_location

# ignore all players nearby (makes sure the amount of falling stars stays constant with varying player count in an area)
tag @a[gamemode=!spectator,distance=..128] add gm4_falling_stars_ignore
