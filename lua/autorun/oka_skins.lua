--------------------------------------------------------------------------------------
--           Реализация поддержки скинов для составов 81-760 и 81-760a              --
--                             Автор: Alexell                                       --
--             https://steamcommunity.com/profiles/76561198210303223                --
--               https://github.com/Alexell/metrostroi_81-760_skins                 --
--------------------------------------------------------------------------------------

-- 81-760
timer.Simple(0.5,function()
	local ENT = scripted_ents.GetStored("gmod_subway_81-760").t
	if not ENT or not  ENT.Spawner then return end
	local skip_textures = false
	local skip_cab_textures = false
	for k,v in pairs(ENT.Spawner) do
		if istable(v) and v[1] == "Version" then table.remove(ENT.Spawner, k) end
		if istable(v) and v[1] == "Texture" then skip_textures = true end
		if istable(v) and v[1] == "CabTexture" then skip_cab_textures = true end
	end
	if not skip_textures then
		local Textures = {}
		for k,v in pairs(Metrostroi.Skins["train"] or {}) do
			if v.typ == "81-760" then Textures[k] = v.name or k end
		end
		table.insert(ENT.Spawner,{"Texture","Окраска кузова","List", Textures})
	end
	if not skip_cab_textures then
		local CabTextures = {}
		for k,v in pairs(Metrostroi.Skins["cab"] or {}) do
			if v.typ == "81-760" then CabTextures[k] = v.name or k end
		end
		table.insert(ENT.Spawner,{"CabTexture","Окраска пульта","List", CabTextures})
	end
	if SERVER then
		local function TrainSpawnerUpdate(self)
			for k in pairs(self:GetMaterials()) do self:SetSubMaterial(k-1,"") end
			for k,v in pairs(self:GetMaterials()) do		
				if v == "models/metrostroi_train/81-760/hull" and self.BKL then	
					self:SetSubMaterial(k-1,"models/metrostroi_train/81-760/hull_bkl")
				end
			end
			self:SetNW2String("texture", self:GetNW2String("Texture", "STL"))	
			for i=1,4 do
				self:SetNW2Int("DoorRBR"..i,1)
				self:SetNW2Int("DoorLBR"..i,1)
			end
			local Announcer = {}
			for k,v in pairs(Metrostroi.AnnouncementsASNP or {}) do if not v.riu then Announcer[k] = v.name or k end end
			if #Metrostroi.CISConfig == 1 then
				self.CISConfig = 1
			else
				self.CISConfig = self:GetNW2Int("CISConfig",1)
			end
		end
		ENT.TrainSpawnerUpdate = TrainSpawnerUpdate
		ENT = scripted_ents.GetStored("gmod_subway_81-761").t
		if ENT then ENT.TrainSpawnerUpdate = TrainSpawnerUpdate end
	end
end)

-- 81-760a (TODO)
