function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Naegling','Gleti','DualWeapons') --'Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian'
	-- Whether to use Carn (or song daggers in general) under a certain threshhold even when weapons are locked.
	state.CarnMode = M{'Never','Always','300','1000'}

	gear.melee_jse_back = {name="Intarabus's Cape",augments={'Accuracy+20 Attack+20'}}
	gear.magic_jse_back = {name="Intarabus's Cape",augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Miracle Cheer'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(True, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind !` gs c cycle ExtraSongsMode')
	send_command('bind ^` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')
	send_command('bind !f7 gs c cycle CarnMode')

	send_command('bind !Numpad7 input /ws "Savage Blade" <t>')
    send_command('bind !Numpad8 input /ws "Rudra\'s Storm" <t>')
    send_command('bind !Numpad9 input /ws "Exenterator" <t>')
	send_command('bind !Numpad5 input /ws "Mordant Rime" <t>')
    send_command('bind !Numpad0 input /ma "Horde Lullaby II"<stnpc>')
	send_command('bind !Numpad1 input /ma "Magic Finale"<stnpc>')
	send_command('bind !Numpad2 input /ma "Foe Requiem VII"<stnpc>')
	send_command('bind !Numpad3 input /console exec BRD Songs')
	send_command('bind !Numpad6 input /ws "Evisceration" <t>')
	send_command('bind !Numpad4 input /ma "Cure IV" <stpc>')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.Gleti = {main="Gleti's Knife",sub="Culminus"}
	sets.weapons.DualWeapons = {main="Gleti's Knife",sub="Blurred Knife +1"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Blurred Knife +1"}
	sets.weapons.Naegling = {main="Naegling",sub="Culminus"}
	sets.weapons.DualTauret = {main="Tauret",sub="Blurred Knife +1"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Malevolence"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Grioavolr",sub="Clerisy Strap",ammo="Impatiens",
		head="Bunzi's Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Fili Cothurnes +2"}
		
	sets.precast.FC.DT = {main="Grioavolr",sub="Clerisy Strap",ammo="Impatiens",
		head="Bunzi's Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Fili Cothurnes +2"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {main="Kali",sub="",range="Miracle Cheer",ammo=empty,
		head="Fili Calot",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Fili Cothurnes +2"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp"})
	sets.precast.FC.Lullaby = {range="Miracle Cheer"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp"}
	sets.precast.FC['Horde Lullaby'] = {range="Miracle Cheer"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp"}
	sets.precast.FC['Horde Lullaby II'] = {range="Miracle Cheer"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Miracle Cheer"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Moonshade Earring",ear2="Mache Earring",
		body="Bihu Justacorps +3",hands="Bunzi's Gloves",ring1="Ramuh Ring",ring2="Petrov Ring",
		back="Bleating Mantle",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS.Acc = {ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Bihu Justacorps +3",hands="Bunzi's Gloves",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS['Savage Blade'] = {ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Justacorps +3",hands="Bunzi's Gloves",ring1="Sroda Ring",ring2="Ifrit Ring",
		back=gear.melee_jse_back,waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Aurgelmir Orb",
		head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Bihu Justacorps +3",hands=gear.chironic_enfeeble_hands,ring1="Metamorph Ring +1",ring2="Shiva Ring +1",
		back=gear.melee_jse_back,waist="Refoccilation Stone",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Kali",sub="Kali",ammo="Hasty Pinion +1",
		head="Bunzi's Hat",neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Fili Cothurnes +2"}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave"}
	sets.midcast.Lullaby = {range="Blurred Harp"}
	sets.midcast.Lullaby.Resistant = {range="Blurred Harp"}
	sets.midcast['Horde Lullaby'] = {range="Blurred Harp"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Blurred Harp"}
	sets.midcast['Horde Lullaby'].AoE = {range="Blurred Harp"}
	sets.midcast['Horde Lullaby II'] = {range="Blurred Harp"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp"}
	sets.midcast.Madrigal = {head="Fili Calot"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {hands="Fili Manchettes"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Kali",sub="Culminus",range="Miracle Cheer",ammo=empty,
		head="Fili Calot",neck="Moonbow Whistle",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Fili Hongreline",hands="Fili Manchettes",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.magic_jse_back,waist="Ovate Rope",legs="Fili Rhingrave",feet="Fili Cothurnes +2"}
		
	sets.midcast.SongEffect.DW = {main="Kali",sub="Kali"} --Only weapons in this set. This set is overlayed onto  SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Kali",sub="Culminus",range="Miracle Cheer",ammo=empty,
		head="Brioso Roundlet +2",neck="Moonbow Whistle",ear1="Etiolation Earring",ear2="Digni. Earring",
		body="Fili Hongreline",hands="Brioso Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.magic_jse_back,waist="Ovate Rope",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}
		
	sets.midcast.SongDebuff.DW = {main="Kali",sub="Kali"} --Only weapons in this set. This set is overlayed onto  SongDebuff

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Daybreak",sub="Ammurapi Shield",range="Miracle Cheer",ammo=empty,
		head="Brioso Roundlet +2",neck="Moonbow Whistle",ear1="Regal Earring",ear2="Digni. Earring",
		body="Bihu Justacorps +3",hands="Brioso Cuffs +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.magic_jse_back,waist="Ovate Rope",legs="Inyanga Shalwar +2",feet="Brioso Slippers +2"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main="Kali",sub="Kali",range="Blurred Harp",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.magic_jse_back,waist="Witful Belt",legs="Fili Rhingrave",feet="Aya. Gambieras +2"}
		
	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Gende. Caubeen",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Inyanga Dastanas +2",ring1="Lebeche Ring",ring2="Sirona's Ring",
        back="Tempered Cape +1",waist="Witful Belt",legs="Inyanga Shalwar +2",feet="Vanya Clogs"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.magic_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Umbra Strap",ammo="Inyanga Dastanas",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chiron_hands_REF,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Inyanga Jubbah +2",hands=gear.chiron_hands_REF,ring1="Defending Ring",ring2="Inyanga Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Assid. Pants +1",feet="Fili Cothurnes +2"}
		
	sets.idle.NoRefresh = {main="Daybreak",sub="Genmei Shield",ammo="Inyanga Dastanas",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.DT = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Fili Cothurnes +2"}
	
	-- Defense sets

	sets.defense.PDT = {main="Mpaca's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head="Bunzi's Hat",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Fili Cothurnes +2"}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet="Fili Cothurnes +2"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",ring2="Chirich Ring",
		back="Grounded Mantle",waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DT = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.engaged.Acc = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Digni. Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Chirich Ring",ring2="Chirich Ring",
		back="Grounded Mantle",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Petrov Ring",ring2="Hetairoi Ring",
		back="Grounded Mantle",waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DW.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.engaged.DW.Acc = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Bard's Charm +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW.Acc.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Bard's Charm +1",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(8, 8)
end

state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Rudra's Storm",['DualWeapons']="Rudra's Storm",['DualNaegling']='Savage Blade',['DualTauret']='Evisceration',
     ['DualAeolian']='Aeolian Edge'}
