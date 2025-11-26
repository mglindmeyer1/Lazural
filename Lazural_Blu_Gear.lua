function user_job_setup()
	
	-- Options: Override default values
    state.OffenseMode:options('Normal','Fodder','Acc','FullAcc')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','SIRD','Resistant','FullMacc','Fodder','Proc')
    state.IdleMode:options('Normal','Regain','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Naegska','Naegbron','Naegada','MeleeClubs','MagicClubs','None','HybridWeapons','Naegmace') --'Almace',

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	gear.da_jse_back = {}
	gear.stp_jse_back = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','"Store TP"+10',}}
	gear.crit_jse_back = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.wsd_jse_back = {name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	gear.nuke_jse_back = {name="Cornflower Cape"}


	autows = 'Savage Blade'

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')
	send_command('bind ^h gs c useitem ring2 Warp Ring')
	send_command('bind !h gs c useitem ring2 Dim. Ring (Holla)')
	
	send_command('bind !Numpad7 input /ws "Savage Blade" <t>')
    send_command('bind !Numpad8 input /ws "Chant du Cygne" <t>')
    send_command('bind !Numpad9 input /ws "Expiacion" <t>')
    send_command('bind !Numpad0 input /ma "Erratic Flutter"<me>')
	send_command('bind !Numpad1 input /ma "Cocoon"<me>')
	send_command('bind !Numpad2 input /ma "Battery Charge"<me>')
	send_command('bind !Numpad3 input /ma "Nat. Meditation"<me>')
	send_command('bind !Numpad6 input /ma "Barrier Tusk"<me>')
	send_command('bind !Numpad4 input /ma "Magic Fruit"<stpc>')

    send_command('bind !m input /ja "Spectral Chair" <me>')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +2"}
	sets.buff['Chain Affinity'] = {head ="Hashishin Kavuk +2"}
	sets.buff.Convergence = {}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape",waist="Flume Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
		
	sets.HPCure = {main="Bunzi's Rod",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Pinga Crown",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Assim. Jubbah +2",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Kunaji Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum",
        head="Carmine Mask",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
	
	sets.Self_Waltz = {body="Passion Jacket",ring1="Asklepian Ring"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
					head="Carmine Mask",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Telos Earring",
					body="Assim. Jubbah +2",hands="Assim. Bazu. +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
					back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.precast.Flourish1 = {ammo="Falcon Eye",
			       head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
                   body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
			       back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	-- Fast cast sets for spells

	sets.precast.FC = {main=gear.Vampirism_1,sub=gear.Vampirism_2,ammo="Impatiens",
		head="Carmine Mask",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Pinga Tunic",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Lebeche Ring",
		back="Swith Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +2"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb",
				  head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket",hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Ifrit Ring +1",
				  back=gear.wsd_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herc_feet_TA}

	sets.precast.WS.Acc = {ammo="Falcon Eye",
				  head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Mache Earring",ear2="Telos Earring",
				  body="Assim. Jubbah +2",hands=gear.herc_hands_AA,ring1="Epona's Ring",ring2="Rufescent Ring",
			      back=gear.wsd_jse_back,waist="Fotia Belt",legs="Carmine Cuisses +1",feet=gear.herc_feet_TA}

	sets.precast.WS.FullAcc = {ammo="Falcon Eye",
				  head="Hashishin Kavuk +2",neck="Sanctity Necklace",ear1="Mache Earring",ear2="Odr Earring",
				  body="Assim. Jubbah +2",hands=gear.herc_hands_AA,ring1="Ramuh Ring +1",ring2="Rufescent Ring",
			      back=gear.wsd_jse_back,waist="Kentarch Belt",legs="Carmine Cuisses +1",feet=gear.herc_feet_TA}

	sets.precast.WS.DT = {ammo="Focal Orb",
				  head="Hashishin Kavuk +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Ayanmo Corazza +2",hands=gear.herc_hands_DT,ring1="Defending Ring",ring2="Ifrit Ring +1",
				  back=gear.wsd_jse_back,waist="Fotia Belt",legs="Ayanmo Cosciales +2",feet=gear.herc_feet_TA}

	sets.precast.WS.Fodder = {ammo="Focal Orb",
				  head="Hashishin Kavuk +2",neck="Fotia Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket",hands="Jhakri Cuffs +2",ring1="Epona's Ring",ring2="Ifrit Ring +1",
				  back=gear.wsd_jse_backk,waist="Fotia Belt",legs="Samnuha Tights",feet=gear.herc_feet_TA}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Floestone",head="Hashishin Kavuk +2",ear1="Odr Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Floestone",head="Hashishin Kavuk +2",ear1="Odr Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Hashishin Kavuk +2",ear1="Odr Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Hashishin Kavuk +2",ear1="Odr Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Falcon Eye",head="Adhemar Bonnet",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Odr Earring",body="Sayadio's Kaftan",hands="Adhemar Wristbands",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",ear2="Odr Earring",ring2="Begrudging Ring",body="Sayadio's Kaftan",back=gear.crit_jse_back,legs="Carmine Cuisses"})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {back=gear.crit_jse_back})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {head="Hashishin Kavuk +2",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Gleti's Cuirass",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Epaminondas's Ring",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Luhlaza Shalwar +3",feet="Gleti's Boots"})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Luhlaza Shalwar +3",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {head="Hashishin Kavuk +2",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Epaminondas's Ring",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Luhlaza Shalwar +3",feet=gear.herc_feet_TA})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {neck="Mirage Stole +1",ear1="Moonshade Earring",body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Luhlaza Shalwar +3",feet=gear.herc_feet_TA})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {body="Assim. Jubbah +2",hands="Jhakri Cuffs +2"})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {back=gear.wsd_jse_back})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Archon Ring",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	sets.precast.WS['Flash Nova'] = {ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=gear.nuke_jse_back})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Cessance Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {main="Vampirism",sub="Sakpata's Sword",ammo="Sapience Orb",
		head="Carmine Mask",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Pinga Tunic",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Swith Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring",ring2="Apate Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Physical.Resistant = {main="Sequence",sub="Almace",ammo="Falcon Eye",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +2",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Luhlaza Shalwar +3",feet="Jhakri Pigaches +1"}

	sets.midcast['Blue Magic'].Physical.Fodder = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Ifrit Ring +1",ring2="Ilabrat Ring",
		back="Cornflower Cape",waist="Grunfeld Rope",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

	sets.midcast['Blue Magic'].PhysicalAcc = {main="Sequence",sub="Almace",ammo="Falcon Eye",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Telos Earring",
	    body="Assim. Jubbah +2",hands="Jhakri Cuffs +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
	    back=gear.da_jse_back,waist="Grunfeld Rope",legs="Luhlaza Shalwar +3",feet=gear.herc_feet_TA}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {main="Bunzi's Rod",sub="Maxentius",ammo="Ghastly Tathlum +1",
		head="Hashishin Kavuk +2",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Hashishin Mintan +2",hands="Hashi. Bazu. +2",ring1="Metamorph Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Skrymir Cord",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}
		 
	sets.midcast['Blue Magic'].Magical.SIRD = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum",
		 head="Hashishin Kavuk +2",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Friomisi Earring",
		 body="Hashishin Mintan +2",hands="Rawhide Gloves",ring1="Defending Ring",ring2="Metamor. Ring +1",
		 back=gear.nuke_jse_back,waist="Emphatikos Rope",legs="Carmine Cuisses +1",feet="Hashi. Basmak +2"}
		 
	sets.midcast['Blue Magic'].Subduction = {main="Bunzi's Rod",sub="Maxentius",ammo="Ghastly Tathlum +1",
		 head="Hashishin Kavuk +2",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		 body="Hashishin Mintan +2",hands="Hashi Bazu. +2",ring1="Metamporh Ring +1",ring2="Shiva Ring +1",
		 back=gear.nuke_jse_back,waist="Skrymir Cord",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {ammo="Sapience Orb",
		head="Carmine Mask",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Luhlaza Jubbah +1",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Swith Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves"}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{neck="Erra Pendant",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",waist="Eschan Stone",feet="Jhakri Pigaches +1"})

	sets.midcast['Blue Magic'].Magical.Fodder = {main="Bunzi's Rod",sub="Maxentius",ammo="Pemphredo Tathlum",
		 head="Hashishin Kavuk +2",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		 body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Shiva Ring",
		 back=gear.ElementalCape,waist=gear.ElementalObi,legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2="Stikini Ring"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Digni. Earring",ear2="Njordr Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring",ring2="Sangoma Ring",
		back="Cornflower Cape",waist="Ovate Rope",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}
		
	sets.midcast['Blue Magic'].Magical.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy
	sets.midcast['Blue Magic'].Subduction.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy

	sets.midcast['Enfeebling Magic'] = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Psycloth Lappas",feet="Skaoi Boots"}

	sets.midcast['Dark Magic'] = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}

	sets.midcast['Enhancing Magic'] = {main="Vampirism", sub="Sakpata's Sword",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{main="Pukulatmuj +1",sub="Sakpata's Sword",head="Carmine Mask",ear2="Mimir Earring",body=gear.taeon_phalanx_body,hands=gear.herculean_phalanx_hands,legs="Carmine Cuisses +1",feet=gear.herculean_nuke_feet})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Bishop's Sash",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}

	sets.midcast['Elemental Magic'] = {main="Maxentius",sub="Sakpata's Sword",ammo="Ghastly Tathlum +1",
		head="Hashishin Kavuk +2",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
		body="Hashishin Mintan +2",hands="Amalric Gages",ring1="Shiva Ring",ring2="Acumen Ring",
		back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}

	sets.midcast['Elemental Magic'].Resistant = {main="Maxentius",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Hashishin Mintan +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Luhlaza Shalwar +3",feet="Hashi. Basmak +2"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {ring2="Weatherspoon Ring"} 

	sets.midcast.Cure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum",
		head="Pinga Crown",neck="Phalania Locket",ear1="Loquac. Earring",ear2="Mendi. Earring",
		body="Pinga Tunic",hands="Telchine Gloves",ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Moonbeam Cape",waist="Bishop's Sash",legs="Gyve Trousers",feet="Medium's Sabots"}
		
	sets.midcast.UnlockedCure = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Metamor. Ring +1",ring2="Lebeche Ring",
		back="Moonbeam Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Assim. Jubbah +2",hands="Luh. Bazubands +1",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {main="Tizona",sub="Sakpata's Sword",ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",neck="Mirage Stole +1",ear1="Telos Earring",ear2="Digni. Earring",
		body="Hashishin Mintan +2",hands="Rawhide Gloves",ring1="Weatherspoon Ring",ring2="Sangoma Ring",
		back="Cornflower Cape",waist="Eschan Stone",legs="Ayanmo Cosciales +2",feet="Hashi. Basmak +2"}

	sets.midcast['Blue Magic'].Stun.Resistant = {main="Tizona",sub="Sakpata's Sword",ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mirage Stole +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Cornflower Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic'].UnlockedAoEHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
					
	sets.midcast['Blue Magic'].AoEHealing = {main="Bunzi's Rod",sub="Nibiru Cudgel",ammo="Pemphredo Tathlum",
		head="Pinga Crown",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Assim. Jubbah +2",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Kunaji Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Gyve Trousers",feet="Medium's Sabots"}

	sets.midcast['Blue Magic'].Healing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum",
		head="Pinga Crown",neck="Phalania Locket",ear1="Loquac. Earring",ear2="Mendi. Earring",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Sirona's Ring",ring2="Lebeche Ring",
		back="Moonbeam Cape",waist="Bishop's Sash",legs="Gyve Trousers",feet="Medium's Sabots"}
		
	sets.midcast['Blue Magic'].UnlockedHealing = {main="Bunzi's Rod",sub="Sakpata's Sword",ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Nyame Mail",hands="Telchine Gloves",ring1="Metamor. Ring +1",ring2="Janniston Ring",
		back="Moonbeam Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {main="Iris",sub="Iris",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",neck="Mirage Stole +1",ear1="Gifted Earring",ear2="Njordr Earring",
		body="Assim. Jubbah +2",hands="Rawhide Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Cornflower Cape",waist="Witful Belt",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

	sets.midcast['Blue Magic'].Buff = {main="Vampirism",sub="Vampirism",ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
		body="Assim. Jubbah +2",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Dark Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Carmine Greaves"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu."}

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Falcon Eye",
			      head=gear.herc_head_Ref,neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Hashishin Mintan +2",hands=gear.herc_hands_Ref,ring1="Defending Ring",ring2="Sheltered Ring",
			      back="Moonbeam Cape",waist="Flume Belt",legs="Rawhide Trousers",feet=gear.herc_feet_Ref}

	-- Idle sets
	sets.idle = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
			      head=gear.herc_head_Ref,neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
			      body="Hashishin Mintan +2",hands=gear.herc_hands_Ref,ring1="Defending Ring",ring2="Gelatinous Ring +1",
			      back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet=gear.herc_feet_Ref}

	sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

	sets.idle.Regain = set_combine(sets.idle, {Head="Gleti's Mask",body="Gleti's Cuirass", Hands="Gleti's Gauntlets", Legs="Gleti's Breeches", Feet="Gleti's Boots"})

	sets.idle.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum",
				head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Tuisto Earring",
		        body="Hashishin Mintan +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
				back="Moonbeam Cape",waist="Flume Belt",legs="Nyame Flanchard",feet=gear.herc_feet_Ref}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})

	-- Defense sets
	sets.defense.PDT = {main="Sakpata's Sword",sub="Genmei Shield",ammo="Staunch Tathlum",
				head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		        body="Hashishin Mintan +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
				back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet=gear.herc_feet_Ref}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
				head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		        body="Hashishin Mintan +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
				back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet=gear.herc_feet_Ref}

    sets.defense.MEVA = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Hashishin Mintan +2",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Carrier's Sash",legs="Telchine Braconi",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Suppanomimi",ear2="Eabani Earring"}
	sets.DWMax = {ear1="Suppanomimi",ear2="Eabani Earring",body="Adhemar Jacket",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt", Legs="Volte Hose"})
	
	-- Weapons sets
	sets.weapons.Naegska = {main="Naegling",sub="Sakpata's Sword"}
	sets.weapons.Tizbron = {main="Tizona",sub="Thibron"}
	sets.weapons.Naegada = {main="Naegling",sub=gear.Colada_1}
	sets.weapons.MagicClubs = {main="Bunzi's Rod",sub="Kaja Rod"}
	sets.weapons.MeleeClubs = {main="Mafic Cudgel",sub="Thibron"}
	sets.weapons.Almace = {main="Almace",sub="Sequence"}
	sets.weapons.Naegbron = {main="Naegling",sub="Thibron"}
	sets.weapons.Naegmace = {main="Naegling",sub="Nibiru Cudgel"}
	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
	sets.weapons.HybridWeapons = {main=gear.Vampirism_1,sub=gear.Vampirism_2}

	-- Engaged sets

	sets.engaged = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Dedition Earring",ear2="Suppanomimi",
			    body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Sailfi Belt +1",legs="Samnuha Tights",feet=gear.herc_feet_TA}

	sets.engaged.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Carmine Greaves"}


	sets.engaged.Acc = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Dampening Tam",neck="Mirage Stole +1",ear1="Cessance Earring",ear2="Telos Earring",
				body="Malignance Tabard",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
				back=gear.stp_jse_back,waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet=gear.herc_feet_TA}

	sets.engaged.Acc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.FullAcc = {main="Tizona",sub="Almace",ammo="Falcon Eye",
				head="Carmine Mask",neck="Mirage Stole +1",ear1="Mache Earring",ear2="Telos Earring",
				body="Ayanmo Corazza +2",hands=gear.herc_hands_AA,ring1="Ramuh Ring",ring2="Begrudging Ring",
				back=gear.da_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herc_feet_TA}

	sets.engaged.FullAcc.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Carmine Mask",neck="Mirage Stole +1",ear1="Mache Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
			    back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}

	sets.engaged.Fodder = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Dedition Earring",ear2="Suppanomimi",
			    body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet=gear.herc_feet_TA}

	sets.engaged.Fodder.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Dampening Tam",neck="Mirage Stole +1",ear1="Dedition Earring",ear2="Telos Earring",
			    body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Windbuffet Belt",legs="Samnuha Tights",feet="Carmine Greaves"}

	sets.engaged.DT = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Dampening Tam",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Suppanomimi",
			    body="Ayanmo Corazza +2",hands=gear.herc_hands_DT,ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Windbuffet Belt",legs="Ayanmo Cosciales +2",feet="Carmine Greaves"}

	sets.engaged.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc.DT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
				
	sets.engaged.Acc.DT.AM = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Digni. Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.FullAcc.DT = {main="Tizona",sub="Almace",ammo="Falcon Eye",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Mache Earring",ear2="Odr Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ramuh Ring +1",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Fodder.DT.AM = {main="Tizona",sub="Almace",ammo="Aurgelmir Orb",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
			    back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages",legs="Assim. Shalwar +3",ring1="Mujin Band",ring2="Locus Ring"}
	sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'WAR' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'THF' then
		set_macro_page(3, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(4, 1)
	else
		set_macro_page(3, 1)
	end
end



autows_list = {['Tizbron']='Expiacion',['Tizalmace']='Expiacion',['Almace']='Chant Du Cygne',['MeleeClubs']='Realmrazer',
     ['HybridWeapons']='Sanguine Blade',['Naegbron']='Savage Blade',['Naegmace']='Savage Blade',['Naegada']='Savage Blade'}