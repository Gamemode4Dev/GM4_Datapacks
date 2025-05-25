# build the line with the proper click event
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/lectern/build_line

$data modify block 29999998 1 7133 front_text.messages[0] set value {"nbt":"lectern_pages[0][0]","storage":"gm4_guidebook:temp","color":"#4AA0C7","click_event":{"action":"change_page","page":$(click)},"hover_event":{"action":"show_text","value":[{"translate":"text.gm4.guidebook.jump_to_section","fallback":"Jump to Section","color":"gold"}]}}
