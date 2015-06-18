minetest.register_craftitem("banhammer:kick_pick", {
	inventory_image = "banhammer_kick_pick.png",
	description = "Kick Pick (Used by mods for kicking players)",
	groups = {not_in_creative_inventory=1},
})

minetest.register_craftitem("banhammer:banhammer", {
	inventory_image = "banhammer_banhammer.png",
	description = "Ban Hammer (Used by mods for baning players)",
	groups = {not_in_creative_inventory=1},
})

minetest.register_on_punchplayer(function(player, hitter)
	local hitter_name = hitter:get_player_name()
	local punched_name = player:get_player_name()
	local hitter_privs = minetest.get_player_privs(hitter_name)
	local hitter_item = hitter:get_wielded_item():get_name()
	print(hitter_item)
	if hitter_privs.kick == true and hitter_item == "banhammer:kick_pick" then
		minetest.kick_player(punched_name)
		return true
	elseif hitter_privs.ban == true and hitter_item == "banhammer:banhammer" then
		minetest.ban_player(punched_name)
		return true
	end
end)

