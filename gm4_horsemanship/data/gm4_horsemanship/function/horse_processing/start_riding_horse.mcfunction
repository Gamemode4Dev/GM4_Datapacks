# process a player that just mounted a horse with gm4_horse tag (or equivalent)
# @s = player riding the horse
# at @s (before mounting)
advancement revoke @s only gm4_horsemanship:start_riding_horse

# check if this horse has a feet item
execute on vehicle unless items entity @s armor.feet poisonous_potato[custom_data~{gm4_horsemanship:{}}] unless items entity @s armor.feet *[custom_data~{smithed:{ignore:{functionality:1b}}}] run item replace entity @s armor.feet with poisonous_potato[custom_data={smithed:{ignore:{functionality:1b}},gm4_horsemanship:{}},enchantments={},equippable={slot:"feet",allowed_entities:"#gm4_horsemanship:trainable"}]

# check for food
execute if predicate gm4_horsemanship:holding_food run return run function gm4_horsemanship:horse_processing/food/feed_added_food

# | If started riding properly
execute on vehicle run tag @s[tag=gm4_horse.glider_disabled] remove gm4_horse.glider_disabled
