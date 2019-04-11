/obj/structure/catwalk
	icon = 'icons/turf/almayer.dmi'
	icon_state = "plating_catwalk"
	var/base_state = "catwalk" //Post mapping
	name = "catwalk"
	desc = "Cats really don't like these things."
	var/covered = 1 //1 for theres the cover, 0 if there isn't.
	unacidable = 1
	layer = CATWALK_LAYER

/obj/structure/catwalk/initialize()
	..()
	update_icon()

/obj/structure/catwalk/update_icon()
	..()
	icon_state = base_state

/obj/structure/catwalk/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/tool/crowbar))
		if(covered)
			var/obj/item/stack/catwalk/R = new(usr.loc)
			R.add_to_stacks(usr)
			covered = 0
			return
	if(istype(W, /obj/item/stack/catwalk))
		if(!covered)
			var/obj/item/stack/catwalk/E = W
			E.use(1)
			covered = 1
			return
	var/turf/T = get_turf(src)
	T.attackby(W, user)
	..()

/obj/structure/catwalk/prison
	icon = 'icons/turf/prison.dmi'
	icon_state = "catwalk"

/obj/structure/catwalk/bigred
	icon = 'icons/turf/catwalks.dmi'
	icon_state = "catwalk0"
	base_state = "catwalk0"