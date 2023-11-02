# update this bed as being slept in
# @s = bed marker
# at @s
# run from home/process_sleep

scoreboard players set $bed_found gm4_ce_data 1


# system should allow for multiple beds per person
# sleeping in bed in the wild should be discouraged (no single use beds)
    # -> sleeping in another home bed is fine
# beds store all their users in an array, use id score instead of UUID
