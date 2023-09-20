------------------------------------------------------------------------------
--                Скины для составов типа 81-760 и 81-760a                  --
--                             Автор: h0w3rS                                --
--                        https://github.com/h0w3rS                         --
------------------------------------------------------------------------------

-- Окраски кузова для 81-760
Metrostroi.AddSkin("train","stlOka",{
    name = "СТЛ",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})

Metrostroi.AddSkin("train","stlOkaNewDecals",{
    name = "СТЛ (2022)",
    typ = "81-760",
    textures = {
	
		["hull"] = "models/metrostroi_train/81-760/hull_2022",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
		["glass_shelk"] = "models/metrostroi_train/81-760/shelk_2022",
    }
})

Metrostroi.AddSkin("train","bklOka",{
    name = "БКЛ",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_bkl",
		["hull"] = "models/metrostroi_train/81-760/hull_bkl",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_bkl",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})

Metrostroi.AddSkin("train","bklOkaNewDecals",{
    name = "БКЛ (2022)",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_bkl",
		["hull"] = "models/metrostroi_train/81-760/hull_bkl_2022",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_bkl",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
		["glass_shelk"] = "models/metrostroi_train/81-760/shelk_2022",
    }
})

Metrostroi.AddSkin("train","mosbrendOka",{
    name = "МосБренд",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_mosbrend",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_mosbrend",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})

Metrostroi.AddSkin("train","expirimental",{
    name = "75 лет Мосметро",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_old",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_metallic",
		["int_0"] = "models/metrostroi_train/81-760/int_metallic",
    }
})

Metrostroi.AddSkin("train","ladogaOka",{
    name = "Ладога (81-780)",
    typ = "81-760",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_ladoga",
		["medium_vag"] = "models/metrostroi_train/81-760/medium_vag_ladoga",
		["int_0"] = "models/metrostroi_train/81-760/int_plastic",
    }
})

-- Окраски кузова для 81-760a
Metrostroi.AddSkin("train","standartBaklan",{
    name = "Стандартный",
    typ = "81-760a",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_baklajan",
    }
})

Metrostroi.AddSkin("train","kolhozBaklan",{
    name = "Колхоз",
    typ = "81-760a",
    textures = {
		["hull"] = "models/metrostroi_train/81-760/hull_baklajan_kolxoz",
    }
})


-- Окраски пульта для 81-760
Metrostroi.AddSkin("cab","standartConsole",{
    name = "Стандартный",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console",
    }
})

Metrostroi.AddSkin("cab","kolxozOneConsole",{
    name = "Вариант 1",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_kolxozOne",
    }
})

Metrostroi.AddSkin("cab","kolxozThreeConsole",{
    name = "Вариант 2",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_kolxozThree",
    }
})

Metrostroi.AddSkin("cab","oldCPOConsole",{
    name = "Вариант 3",
    typ = "81-760",
    textures = {
		["console"] = "models/metrostroi_train/81-760/console_oldCPO",
    }
})