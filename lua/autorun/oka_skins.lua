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
			if self:GetNW2String("Texture"):find("bkl") then
				self.STL = false
				self.BKL = true
			end
			self:SetNW2Bool("STL", self.STL)
			self:SetNW2Bool("BKL", self.BKL)
			self:SetNW2String("texture", self:GetNW2String("Texture"))
			self:SetNW2String("cabtexture", self:GetNW2String("CabTexture"))
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
	else
		local function UpdateTextures(self)
			self.Texture = self:GetNW2String("texture")
			self.PassTexture = self:GetNW2String("passtexture")
			self.CabinTexture = self:GetNW2String("cabtexture")
			self.LastStation = self:GetNW2Int("LastStation")
			self.RouteNumber = self:GetNW2Int("RouteNumber")
			self.Number = self:GetWagonNumber()
			self.Scheme = self:GetNW2Int("Scheme",1)
			self.InvertSchemes = self:GetNW2Bool("PassSchemesInvert",false)
			local sarmat,sarmatr = self.ClientEnts.PassSchemes,self.ClientEnts.PassSchemesR
			if IsValid(sarmat) and IsValid(sarmatr) and Metrostroi.Skins["760_schemes"] and Metrostroi.Skins["760_schemes"][self.Scheme] then
				local scheme = Metrostroi.Skins["760_schemes"][self.Scheme]
				sarmat:SetSubMaterial(0,scheme[1])
				sarmatr:SetSubMaterial(0,scheme[1])
			end
			self.keyval = -1

			self.CISConfig = self:GetNW2Int("CISConfig",1)
			local Announcer = {}
			for k,v in pairs(Metrostroi.AnnouncementsASNP or {}) do if not v.riu then Announcer[k] = v.name or k end end
			if #Metrostroi.CISConfig == 1 then
				self.CISConfig = 1
			end
			
			for i=0,4 do
				local num = tostring(self.Number)[i+1]
				if not num or num == "" then num = "3" end
				if IsValid(self.ClientEnts["TrainNumber"..i]) then
					local number = self.ClientEnts["TrainNumber"..i]
					number:SetPos(self:LocalToWorld(Vector(509.8,-48+i*5.8,-16)))
					number:SetAngles(self:LocalToWorldAngles(Angle(-6,0,0)))
					number:SetModel("models/metrostroi_train/81-760/numbers/number_"..num..".mdl")
				end
				if IsValid(self.ClientEnts["TrainNumberL"..i]) then
					local number = self.ClientEnts["TrainNumberL"..i]
					number:SetPos(self:LocalToWorld(Vector(269-i*5.8,68,-21)))
					number:SetAngles(self:LocalToWorldAngles(Angle(0,90,0)))
					number:SetModel("models/metrostroi_train/81-760/numbers/number_"..num..".mdl")
				end
				if IsValid(self.ClientEnts["TrainNumberR"..i]) then
					local number = self.ClientEnts["TrainNumberR"..i]
					number:SetPos(self:LocalToWorld(Vector(-443.7+i*5.8,-68,-21)))
					number:SetAngles(self:LocalToWorldAngles(Angle(0,-90,0)))
					number:SetModel("models/metrostroi_train/81-760/numbers/number_"..num..".mdl")
				end
			end
			if not IsValid(self.RearBogey) then
				self.RearBogey = self:GetNW2Entity("RearBogey")		
			end
			if not IsValid(self.FrontBogey) then
				self.FrontBogey = self:GetNW2Entity("FrontBogey")
			end
		end
		ENT.UpdateTextures = UpdateTextures
		ENT = scripted_ents.GetStored("gmod_subway_81-761").t
		if ENT then ENT.UpdateTextures = UpdateTextures end
	end
end)

-- 81-760a (TODO)
