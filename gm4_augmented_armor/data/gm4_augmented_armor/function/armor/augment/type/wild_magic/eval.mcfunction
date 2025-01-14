# apply the stored effect to player
# @s = player wearing armor
# at @s
# run from armor/augment/type/wild_magic/activate

$effect give @s $(id) $(duration) $(level)
$tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Wild Magic: ","color":"gray"},{"text":"$(id) $(level) - $(duration)s","color":"dark_gray"}]
