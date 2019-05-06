class_name HitableObject

extends physics_object


# Should affect the CharacterStat that hit this object.
# Hit should be called from the other CharacterStat
func hit(other : CharacterStats):
	printerr("Hit not implemented in " + name)