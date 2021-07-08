# @s = player consuming any multi_use_bottle
# at @s
# run from advancement gm4_zauber_cauldrons:use/multi_use_bottle

# for survival or adventure players: consume bottle
execute if entity @s[gamemode=!spectator,gamemode=!creative] run function gm4_zauber_cauldrons:player/multi_use_bottle/cache/populate

# revoke advancement if gamemode is creative or spectator
# (advancement is used as marker and will be removed a tick later for survival or adventure players, see player/multi_use_bottle/modify_bottle)
execute unless entity @s[gamemode=!spectator,gamemode=!creative] run advancement revoke @s only gm4_zauber_cauldrons:use/multi_use_bottle
