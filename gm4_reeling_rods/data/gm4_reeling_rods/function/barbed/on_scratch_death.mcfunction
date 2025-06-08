# handles entities scratched to death
# @s = entity who died by immediate damage from a barbed rod
# at @s
# run from barbed/apply

# death message
tellraw @a ["",{"translate":"text.gm4.reeling_rods.death.scratch","fallback":"%s was scratched to death by %s",with:[{"selector":"@s"},{"selector":"@p[tag=gm4_reeling_rods.player]"}]}]

# reset barbed state
function gm4_reeling_rods:barbed/clear
