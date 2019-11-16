#run from projectile_player
#@s = arrow on a hopper, at @s

#check if there is any place in the hopper
execute if data block ~ ~-.1 ~ Items[4] run function better_hoppers:arrow/full
execute unless data block ~ ~-.1 ~ Items[4] run function better_hoppers:arrow/drop