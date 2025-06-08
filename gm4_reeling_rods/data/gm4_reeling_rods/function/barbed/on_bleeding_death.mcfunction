# handles entities bleeding to death
# @s = entity who died by bleeding to death from barbed damage
# at @s
# run from barbed/update_timer

# death message
tellraw @a ["",{"translate":"text.gm4.reeling_rods.death.bleeding","fallback":"%s succumbed to their injuries",with:[{"selector":"@s"}]}]

# reset barbed state
function gm4_reeling_rods:barbed/clear
