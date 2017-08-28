--[[
rocks (exhaustable)

]]

AddCSLuaFile()

ENT.Type = "anim"

ENT.rockTable = {	"models/props_wasteland/rockgranite03c.mdl", "models/props_wasteland/rockgranite03c.mdl", "models/props_wasteland/rockgranite03b.mdl", "models/props_wasteland/rockgranite03a.mdl", 
					"models/props_wasteland/rockgranite02c.mdl", "models/props_wasteland/rockgranite02b.mdl", "models/props_wasteland/rockgranite02a.mdl"}

function ENT:Initialize()
	if SERVER then
		self:SetModel(self.rockTable[math.random(#self.rockTable)])

		self:PhysicsInitStandard()
		--self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
	end

	self:SetMoveType(MOVETYPE_VPHYSICS)

	self.health = 250
end


function ENT:OnTakeDamage(damageto)
	self.health = self.health - damageto:GetDamage()
	if self.health <= 0 then
		self:EmitSound("physics/concrete/boulder_impact_hard"..math.random(4)..".wav")
		self:Remove()		
	end
end