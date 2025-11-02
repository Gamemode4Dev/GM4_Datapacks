# process a player that just tamed a horse (or equivalent)
# @s = player taming the horse
# at @s
advancement revoke @s only gm4_horsemanship:tame_horse

execute on vehicle if entity @s[type=#gm4_horsemanship:trainable,tag=gm4_horse,tag=!gm4_horse.tamed] run function gm4_horsemanship:level/tame_horse_init
