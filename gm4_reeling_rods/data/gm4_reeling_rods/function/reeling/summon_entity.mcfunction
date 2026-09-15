# Summons a generic entity with data
# @s = entity that was hooked
# at @s (unless run from enderman)
# with $entity_type: string entity type
# with $entity_data: nbt compound of data to summon on this entity
# run from reeling/chest_boat/action and reeling/{minecart|mooshroom} and reeling/enderman/falling_block

$summon $(entity_type) ~ ~ ~ $(entity_data)
