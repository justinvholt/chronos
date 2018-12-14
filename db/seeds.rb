# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts "seeding user"
user_count = 0

User.create(email: "UserOne@gmail.com", password: "password")
user_count += 1
User.create(email: "UserTwo@gmail.com", password: "password")
user_count += 1

puts "succesfully seeded #{user_count} users"
puts "#{User.all.length} users in database"
puts "------------------------------------------------------------"
puts "seeding fixtures"
fixture_count = 0

1.times do

  vesname = ["ms Eagle", "ms Razorbill", "ms Albatros", "ms Goose", "ms Hornbill", "ms Toucan"].sample
  charterer = ["Petrochem", "Chemtrade", "Shell", "Dow Chemicals", "BASF", "Unilever"].sample

  if Fixture.where(vessel_name: vesname) == []
    voynum = rand(20..250)
  else
    voynum = Fixture.where(vessel_name: vesname).last.voyage_number + 1
  end

  Fixture.create(
    reference_no: "4837" + rand(100..500).to_s,
    charterer: charterer,
    vessel_name: vesname,
    voyage_number: voynum,
    demurrage_rate: rand(200..400) * 100,
    total_demurrage: 12430,
    allowed_laytime: rand(20..60),
    required_action: "Invoicing",
    voyage_status: "Voyage complete",
    days_until_completion: 0
    )
  fixture_count += 1
end

1.times do

  vesname = ["ms Eagle", "ms Razorbill", "ms Albatros", "ms Goose", "ms Hornbill", "ms Toucan"].sample
  charterer = ["Petrochem", "Chemtrade", "Shell", "Dow Chemicals", "BASF", "Unilever"].sample

  if Fixture.where(vessel_name: vesname) == []
    voynum = rand(20..250)
  else
    voynum = Fixture.where(vessel_name: vesname).last.voyage_number + 1
  end

  Fixture.create(
    reference_no: "4837" + rand(100..500).to_s,
    charterer: charterer,
    vessel_name: vesname,
    voyage_number: voynum,
    demurrage_rate: rand(200..400) * 100,
    allowed_laytime: rand(20..60),
    required_action: "",
    voyage_status: "Enroute discharge port",
    days_until_completion: 4
    )
  fixture_count += 1
end

1.times do

  vesname = ["ms Eagle", "ms Razorbill", "ms Albatros", "ms Goose", "ms Hornbill", "ms Toucan"].sample
  charterer = ["Petrochem", "Chemtrade", "Shell", "Dow Chemicals", "BASF", "Unilever"].sample

  if Fixture.where(vessel_name: vesname) == []
    voynum = rand(20..250)
  else
    voynum = Fixture.where(vessel_name: vesname).last.voyage_number + 1
  end

  Fixture.create(
    reference_no: "4837" + rand(100..500).to_s,
    charterer: charterer,
    vessel_name: vesname,
    voyage_number: voynum,
    demurrage_rate: rand(200..400) * 100,
    required_action: "",
    voyage_status: "At discharge port",
    days_until_completion: 12
    )
  fixture_count += 1
end

1.times do

  vesname = ["ms Eagle", "ms Razorbill", "ms Albatros", "ms Goose", "ms Hornbill", "ms Toucan"].sample
  charterer = ["Petrochem", "Chemtrade", "Shell", "Dow Chemicals", "BASF", "Unilever"].sample

  if Fixture.where(vessel_name: vesname) == []
    voynum = rand(20..250)
  else
    voynum = Fixture.where(vessel_name: vesname).last.voyage_number + 1
  end

  Fixture.create(
    reference_no: "4837" + rand(100..500).to_s,
    charterer: charterer,
    vessel_name: vesname,
    voyage_number: voynum,
    demurrage_rate: rand(200..400) * 100,
    allowed_laytime: rand(20..60),
    required_action: "Validate",
    voyage_status: "Enroute loadport 2/2",
    days_until_completion: 14
    )
  fixture_count += 1
end

1.times do

  vesname = ["ms Eagle", "ms Razorbill", "ms Albatros", "ms Goose", "ms Hornbill", "ms Toucan"].sample
  charterer = ["Petrochem", "Chemtrade", "Shell", "Dow Chemicals", "BASF", "Unilever"].sample

  if Fixture.where(vessel_name: vesname) == []
    voynum = rand(20..250)
  else
    voynum = Fixture.where(vessel_name: vesname).last.voyage_number + 1
  end

  Fixture.create(
    reference_no: "4837" + rand(100..500).to_s,
    charterer: charterer,
    vessel_name: vesname,
    voyage_number: voynum,
    demurrage_rate: rand(200..400) * 100,
    allowed_laytime: rand(20..60),
    required_action: "",
    voyage_status: "Voyage to commence",
    days_until_completion: 27
    )
  fixture_count += 1
end


puts "succesfully seeded #{fixture_count} fixtures"
puts "#{Fixture.all.length} fixtures in database"
puts "------------------------------------------------------------"
puts "seeding fixture_cargoes"

cargo_count = 0

  Fixture.all.each do |fixture|
    FixtureCargo.create!(
      name: "Xylene",
      quantity_mts: 400,
      obl: 10,
      load_port: "Santos",
      load_terminal: "Petrochem",
      load_berth: "H",
      disch_port: "Houston",
      disch_terminal: "Chevron",
      disch_berth: "4",
      fixture: fixture
    )
    cargo_count += 1

    FixtureCargo.create!(
      name: "Toluene",
      quantity_mts: 900,
      obl: 20,
      load_port: "Santos",
      load_terminal: "Petrochem",
      load_berth: "H",
      disch_port: "New Orleans",
      disch_terminal: "Stolthaven",
      disch_berth: "B",
      fixture: fixture
    )
    cargo_count += 1

    FixtureCargo.create!(
      name: "Solvanol",
      quantity_mts: 400,
      obl: 30,
      load_port: "Santos",
      load_terminal: "Petrochem",
      load_berth: "H",
      disch_port: "New Orleans",
      disch_terminal: "Stolthaven",
      disch_berth: "B",
      fixture: fixture
    )
    cargo_count += 1

    FixtureCargo.create!(
      name: "Luboil 40A",
      obl: 40,
      quantity_mts: 2000,
      load_port: "Santos",
      load_terminal: "Petrochem",
      load_berth: "H",
      disch_port: "New Orleans",
      disch_terminal: "Stolthaven",
      disch_berth: "B",
      fixture: fixture
    )
    cargo_count += 1

    FixtureCargo.create!(
      name: "Syrene Monomer",
      obl: 50,
      quantity_mts: 1500,
      load_port: "Santos",
      load_terminal: "Petrochem",
      load_berth: "H",
      disch_port: "New Orleans",
      disch_terminal: "Stolthaven",
      disch_berth: "B",
      fixture: fixture
    )
    cargo_count += 1
  end

puts "succesfully seeded #{cargo_count} fixtures, should be #{Fixture.all.length * 5}"
puts "#{FixtureCargo.all.length} fixture_cargoes in database"
puts "------------------------------------------------------------"
puts "seeding clauses"

clause_count = 0


 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Notice of Readiness",
    paragraph: "6",
    wording: "Upon arrival at customary anchorage at each port of loading or discharge, the Master or his agent shall give the Charterer or his agent notice by letter, telegraph, wireless or telephone that the Vessel is ready to load or discharge cargo, berth or no berth, and laytime, as hereinafter provided, shall commence upon the expiration of six (6) hours after receipt of such notice, or upon the Vessel's arrival in berth (i.e. finished mooring when at a sealoading or discharging terminal and all fast when loading or discharging alongside a wharf), whichever first occur. However, where delay is caused to Vessel getting into berth after giving notice of readiness for any reason over which Charterer has no control, such delay shall not count as used laytime.",
    bloc: :start_nor_6
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Hoses: Moorning at sea terminals",
    paragraph: "11",
    wording: "Hoses for loading and discharging shall be furnished by the Charterer and shall be connected and disconnected by the Charterer, or, at the option of the Owner, by the Owner at the Charterer's risk and expense. Laytime shall continue until the hoses have been disconnected. When Vessel loads or discharges at a sea terminal, the Vessel shall be properly equipped at Owner's expense for loading or discharging at such place, including suitable ground tackle, mooring lines and equipment for handling submarine hoses.",
    bloc: :stop_documents
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Laydays",
    paragraph: "5",
    wording: "Laytime shall not commence before the date stipulated in Part I, except with the Charterer's sanction. Should the Vessel not be ready to load by 4:00 o'clock P.M. (local time) on the cancelling date stipulated in Part I, the Charterer shall have the option of cancelling this Charter by giving the Owner notice of such cancellation within twenty-four (24) hours after such cancellation date; otherwise this Charter to remain in full force and effect.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Hours for loading and discharging",
    paragraph: "7",
    wording: "The number of running hours specified as laytime in Part I shall be permitted the Charterer as laytime for loading and discharging cargo; but any delay due to the Vessel's condition or breakdown or inability of the Vessel's facilities to load or discharge cargo within the time allowed shall not count as used laytime. If regulations of the Owner or port authorities prohibit loading or discharging of the cargo at night, time so lost shall not count as used laytime; if the Charterer, shipper or consignee prohibits loading or discharging at night, time so lost shall count as used laytime. Time consumed by the vessel in moving from loading or discharge port anchorage to her loading or discharging berth, discharging ballast water or slops, will not count as used laytime.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Demurrage",
    paragraph: "8",
    wording: "Charterer shall pay demurrage per running hour and pro rata for a part thereof at the rate specified in Part I for all time that loading and discharging and used laytime as elsewhere herein provided exceeds the allowed laytime elsewhere herein specified. If, however, demurrage shall be incurred at ports of loading and / or discharge by reason of fire, explosion, storm or by a strike, lockout, stoppage or restraint of labor or by breakdown of machinery or equipment in or about the plant of the Charterer, supplier, shipper or consignee of the cargo, the rate of demurrage shall be reduced one-half of the amount stated in Part I per running hour or pro rata for part of an hour for demurrage so incurred. The Charterer shall not be liable for any demurrage for delay caused by strike, lockout, stoppage or restraint of labor for Master, officers and crew of the Vessel or tugboat or pilots.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Safe berthing-shifting",
    paragraph: "9",
    wording: "The Vessel shall load and discharge at any safe place or wharf, or alongside vessels or lighters reachable on her arrival, which shall be designated and procured by the Charterer, provided the Vessel can proceed thereto, lie at, and depart therefrom always safely afloat, any ligtherage being at the expense, risk and peril of the Charterer. The Charterer shall have the right of shifting the Vessel at ports of loading and / or discharge from one safe berth to another on payment of all towage and pilotage shifting to next berth, charges for running lines on arrival at and leaving that berth, additional agency charges and expenses, customs overtime and fees, and any other extra port charges or port expenses incurred by reason of using more than one berth. Time consumed on account of shifting shall count as used laytime except as otherwise provided in Clause 15.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Pumping in and out",
    paragraph: "10",
    wording: "The cargo shall be pumped into the Vessel at the expense, risk and peril of the Charterer, and shall be pumped out of the Vessel at the expense of the Vessel, but at the risk and peril only so far as the Vessel's permanent hose connections, where delivery of the cargo shall be taken by the Charterer or its consignee. If required by Charterer, Vessel after discharging is to clear shore pipe lines of cargo by pumping water through them and time consumed for this purpose shall apply against allowed laytime. The Vessel shall supply her pumps and the necessary power for discharging in all ports, as well as necessary hands. However, should the Vessel be prevented from supplying such power by reason of regulations prohibiting fires on board, the Charterer or consignee shall supply, at its expense, all power necessary for discharging as well as loading, but the Owner shall pay for power supplied to the Vessel for other purposes. If cargo is loaded from lighters, the Vessel shall furnish steam at Charterer's expense for pumping cargo into the Vessel, if requested by the Charterer, providing the Vessel has facilities for generating steam and is permitted to have fires on board. All overtime of officers and crew incurred in loading and / or discharging shall be for account of the Vessel.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "ICE",
    paragraph: "14(a)",
    wording: "In case port of loading or discharge should be inaccessible owing to ice, the Vessel shall direct her course according to Master's judgement, notifying by telegraph or radio, if available, the Charterers, shipper or consignee, who is bound to telegraph or radio orders for another port, which is free from ice and where there are facilities for the loading or reception of the cargo in bulk. The whole of the time occupied from the time the Vessel is diverted by reason of the ice until her arrival at an ice-free port of loading or discharge, as the case may be, shall be paid for by the Charterer at the demurrage rate stipulated in Part I.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "ICE",
    paragraph: "14(b)",
    wording: "If on account of ice the Master considers it dangerous to enter or remain at any loading or discharging place for fear of the Vessel being frozen in or damaged, the Master shall communicate by telegraph or radio, if available, with the Charterer, shipper or consignee of the cargo, who shall telegraph or radio him in reply, giving orders to proceed to another port as per Clause 14 (a) where there is no danger of ice and where there are the necessary facilities for the loading or reception of the cargo in bulk, or to remain at the original port at their risk, in either case Charterer to pay for the time that the Vessel may be delayed, at the demurrage rate stipulated in Part I.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Two or more ports counting as one",
    paragraph: "15",
    wording: "To the extent that the freight rate standard of reference specified in Part I F hereof provides for special groupings or combinations of ports or terminals, any two or more ports or terminals within each such grouping or combination shall count as one port for purposes of calculating freight and demurrage only, subject to the following conditions:
              a) Charterer shall pay freight at the highest rate payable under Part I F hereof for a voyage between the loading and discharge ports used by Charterer.
              b) All charges normally incurred by reason of using more than one berth shall be for Charterer's account as provided in Clause 9 hereof.
              c) Time consumed shifting between the ports or terminals within the particular grouping or combination shall not count as used laytime.
              d) Time consumed shifting between berths within one of the ports or terminals of the particular grouping or combination shall count as used laytime.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Quarantine",
    paragraph: "17(a)",
    wording: "Should the Charterer send the Vessel to any port or place where a quarantine exists, any delay thereby caused to the Vessel shall count as used laytime; but should the quarantine not be declared until the Vessel is on passage to such port, the Charterer shall not be liable for any resulting delay.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Fumigation",
    paragraph: "17(b)",
    wording: "If the Vessel, prior to or after entering upon this Charter, has docked or docks at any wharf which is not rat-free or stegomyia-free, she shall, before proceeding to a rat-free or stegomyia-free wharf, be fumigated by the Owner at his expense, except that if the Charterer ordered the Vessel to an infected wharf the Charterer shall bear the expense of fumigation.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "General Exceptions",
    paragraph: "19",
    wording: "The Vessel, her Master and Owner shall not, unless otherwise in this Charter expressly provided, be responsible for any loss or damage, or delay or failure in performing hereunder, arising from:
              - any act, neglect, default or barratry of the Master, pilots, mariners or other servants of the Owner in the navigation or management of the Vessel;
              - fire, unless caused by the personal design or neglect of the Owner; - collision, stranding or peril, danger or accident of the sea or other navigable waters;
              - saving or attempting to save life or property;
              - wastage in weight or bulk, or any other loss or damage arising from inherent defect, quality or vice of the cargo;
              - any act or omission of the Charterer or Owner, shipper or consignee of the cargo, their agents or representatives;
              - insufficiency of packaging;
              - insufficiency or inadequacy of marks;
              - explosion, bursting of boilers, breakage of shafts, or any latent defect in hull, equipment or machinery;
              - unseaworthiness of the Vessel unless caused by want of due diligence on the part of the Owner to make the Vessel seaworthy or to have her properly manned, equipped and supplied; or
              - from any other cause of whatsoever kind arising without the actual fault or privity of the Owner. And neither the Vessel nor Master or Owner, nor the Charterer, shall, unless otherwise in this Charter expressly provided, be responsible for any loss or damage or delay or failure in performing hereunder, arising or resulting from:
              - Act of God;
              - act of war;
              - perils of the seas;
              - act of public enemies, pirates or assailing thieves;
              - arrest or restraint of princes, rulers or people; or
              - seizure under legal process provided bond is promptly furnished to release the Vessel or cargo;
              - strike or lockout or stoppage or restraint of labor from whatever cause, either partial or general; or
              - riot or civil commotion.",
    bloc: :no_method
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Oil pollution clause",
    paragraph: "26",
    wording: "...part... The Charterer agrees to pay freight as per the terms of the
            Charter Party on any consolidated tank washings, dirty ballast, etc., retained on
            board on Charterer's instructions during the loaded portion of the voyage up to a
            maximum of 1% of the total deadweight of the vessel that could be legally carried
            for such voyage. Any extra expenses incurred by the vessel at loading or discharging
            port in pumping ashore oil residues shall be for Charterer's account, and extra
            time, if any, consumed for this operation shall count as used laytime.",
    bloc: :no_method
    )
  clause_count += 1
end

puts "succesfully seeded #{clause_count} Asbatankvoy clauses"
puts "#{Clause.all.length} clauses in database"
puts "------------------------------------------------------------"

  shell_count = 0

 1.times do
  shellvoy6_laytime = Clause.create(
    cp_form: "Shellvoy6",
    parent_relation: "standard",
    title: "Laytime",
    paragraph: "12",
    wording: "12. (1) The laytime for loading, discharging and all other Charterers'
            purposes whatsoever shall be the number of running hours specified in Part I clause
            (I). Charterers shall have the right to load and discharge at all times, including
            night, provided that they shall pay for all extra expenses incurred ashore.
            (2) If vessel is able to, and Charterers so instruct, the vessel shall load earlier
            than the commencement of laydays and Charterers shall have the benefit of such time
            saved by way of offset from any demurrage incured. Such benefit shall be the time
            between commencement of loading until the commencement of the original laydays.",
    bloc: :start_nor
    )
  shell_count += 1
end

 1.times do
  shellvoy6_nor = Clause.create(
    cp_form: "Shellvoy6",
    parent_relation: "standard",
    title: "Notice of readiness/ Running time",
    paragraph: "13",
    wording: "(1) Subject to the provisions of Part II clauses 13(3) and 14,
              (a)  Time at each loading or discharging port shall commence to run 6 hours after
              the vessel is in all respects ready to load or discharge and written notice thereof
              has been tendered by the master or Owners' agents to Charterers or their agents and
              the vessel is securely moored at the specified loading or discharging berth. However,
              if the vessel does not proceed immediately to such berth time shall commence to run 6
              hours after (i) the vessel is lying in the area where she was ordered to wait or, in
              the absence of any such specific order, in a usual waiting area and (ii) written
              notice of readiness has been tendered and (iii) the specified berth is accessible. A
              loading or discharging berth shall be deemed inaccessible only for so long as the
              vessel is or would be prevented from proceeding to it by bad weather, tidal conditions,
              ice, awaiting daylight, pilot or tugs, or port traffic control requirements (except
              those requirements resulting from the unavailability of such berth or of the cargo).
              If Charterers fail to specify a berth at any port, the first berth at which the vessel
              loads or 209 discharges the cargo or any part thereof shall be deemed to be the specified
              berth at such 210 port for the purposes of this clause. Notice shall not be tendered
              before commencement of laydays and notice tendered by radio shall qualify as written
              notice provided it is confirmed in writing as soon as reasonably possible. Time shall
              never commence before six hours after commencement of laydays unless loading commences
              prior to this time as provided in clause 13 (3). If Owners fail; (i)  to obtain Customs
              clearance; and/or (ii)  to obtain free pratique unless this is not customary prior to
              berthing; and/or (iii)  to have on board all papers/certificates required to perform this
              Charter.......",
      bloc: :stop_hose_disconnected
      )
  shell_count += 1
end

 1.times do
  shellvoy6_laytime = Clause.create(
    cp_form: "Shellvoy6",
    parent_relation: "standard",
    title: "Suspension of time",
    paragraph: "14",
    wording: "Time shall not count when: (a) spent on inward passage from the vessel's waiting area
              to the loading or discharging berth specified by Charterers, even if lightening occurred
              at such waiting area; or (b) spent in carrying out vessel operations, including but not
              limited to bunkering, discharging slops and tank washings, and handling ballast, except
              to the extent that cargo operations are 246 carried on concurrently and are not delayed
              thereby; or (c) lost as a result of: (i) breach of this Charter by Owners; or (ii) any
              cause attributable to the vessel, (including but not limited to the warranties in Part I
              (A) of this Charter) including breakdown or inefficiency of the vessel; or (iii) strike,
              lock-out, stoppage or restraint of labour of master, officers or crew of the vessel or tug
              boats or pilot.",
    bloc: :susp_shifting_anchorage
    )
  shell_count += 1
end

 1.times do
  shellvoy6_laytime = Clause.create(
    cp_form: "Shellvoy6",
    parent_relation: "standard",
    title: "Demurrage",
    paragraph: "15",
    wording: "15. (1) Charterers shall pay demurrage at the rate specified in Part I clause (J).
            If the demurrage rate specified in Part I clause (J) is expressed as a percentage of Worldscale such
            percentage shall be applied to the demurrage rate applicable to vessels of a similar size to the vessel
            as provided in Worldscale or, for the purpose of clause 10 and/or if this Charter is terminated prior
            to the commencement of loading, in Worldscale current at the termination date specified in Part I clause (C).
            Demurrage shall be paid per running day or pro rata for part thereof for all time which, under the provisions
            of this Charter, counts against laytime or for demurrage and which exceeds the laytime specified in Part I
            clause (I). Charterers' liability for exceeding the laytime shall be absolute and shall not in any case
            be subject to the provisions of Part II clause 32. (2) If, however, all or part of such demurrage arises
            out of or results from fire or explosion or strike or failure/breakdown of plant and/or machinery at ports
            of loading and/or discharging in or about the plant of Charterers, shippers or consignees of the cargo
            (not being a fire or explosion caused by the negligence or wilful act or omission of Charterers, shippers
            or consignees of the cargo or their respective servants or agents), act of God, act of war, riot, civil
            commotion, or arrest or restraint of princes, rulers or peoples, the laytime used and/or the rate of
            demurrage shall be reduced by half for such laytime used and/or for such demurrage or such parts thereof.
            (3) Owners shall notify Charterers within 60 days after completion of discharge if demurrage has been
            incurred and any demurrage claim shall be fully and correctly documented, and received by Charterers, within
            90 days after completion of discharge . If Owners fail to give notice of or to submit any such claim with
            documentation, as required herein, within the limits aforesaid, Charterers' liability for such demurrage shall be
            extinguished. (4) If any part cargo for other charterers, shippers or consignees (as the case may be) is
            loaded or discharged at the same berth, then any time used by the vessel waiting at or for such berth and in
            loading or discharging which would otherwise count as laytime or if the vessel is on demurrage for
            demurrage, shall be pro-rated in the proportion that Charterers’ cargo bears to the total cargo to be
            loaded or discharged at such berth. If however, the running of laytime or demurrage, if on demurrage,
            is solely attributable to other parties’ cargo operations then such time shall not count in calculating
            laytime or demurrage, if on demurrage, against Charterers under this Charter.",
    bloc: :no_method
    )
  shell_count += 1
end

puts "succesfully seeded  #{shell_count} Shellvoy6 clauses"
puts "#{Clause.all.length} clauses in database"
puts "------------------------------------------------------------"

@clauses_asbatank_std = Clause.where(cp_form: "Asbatankvoy", parent_relation: "standard")
@clausegroup_asbatank_std = ClauseGroup.create(name: "Asbatankvoy standard")
@clauses_asbatank_std.each do |clause|
  clause_join = ClauseGroupJoin.new
  clause_join.clause_group = @clausegroup_asbatank_std
  clause_join.clause = clause
  clause_join.save
end

puts "succesfully seeded #{@clausegroup_asbatank_std.name} with #{ClauseGroup.where(name: "Asbatankvoy standard").first.clauses.count} clauses"
puts "#{ClauseGroup.count} in the database"
puts "------------------------------------------------------------"

@clauses_shellvoy6_std = Clause.where(cp_form: "Shellvoy6", parent_relation: "standard")
@clausegroup_lewagon_std = ClauseGroup.create(name: "Le Wagon transatlantic")
@clauses_shellvoy6_std.each do |clause|
  clause_join = ClauseGroupJoin.new
  clause_join.clause_group = @clausegroup_lewagon_std
  clause_join.clause = clause
  clause_join.save
end

puts "succesfully seeded #{@clausegroup_lewagon_std.name} with #{ClauseGroup.where(name: "Le Wagon transatlantic").first.clauses.count} clauses"
puts "#{ClauseGroup.count} in the database"
puts "------------------------------------------------------------"

Fixture.all.each do |fixture|
  fixture.clause_group = @clausegroup_lewagon_std
  puts "assigned clause_group to fixture" if fixture.save!
end

if @wagon_fixture = Fixture.create!(
  reference_no: "4839" + rand(100..500).to_s,
  charterer: "Le Wagon",
  vessel_name: "ms Macaw",
  voyage_number: 126,
  demurrage_rate: 40000,
  allowed_laytime: 74,
  calculation_status: "update details",
  clause_group: @clausegroup_lewagon_std,
  required_action: "Complete Data",
  voyage_status: "voyage complete",
  days_until_completion: 0
  )

  puts "succesfully seeded presentation fixture LeWagon"
  puts "------------------------------------------------------------"

end

FixtureCargo.create!(
  name: "Caipirinha",
  quantity_mts: 2000,
  obl: 1,
  load_port: "Rio de Janeiro",
  load_terminal: "Copersucar",
  load_berth: "B",
  disch_port: "Le Havre",
  disch_terminal: "Total",
  disch_berth: "3A",
  fixture: @wagon_fixture
)
cargo_count += 1

FixtureCargo.create!(
  name: "Ethanol",
  obl: 2,
  quantity_mts: 2000,
  load_port: "Rio de Janeiro",
  load_terminal: "Copersucar",
  load_berth: "B",
  disch_port: "Le Havre",
  disch_terminal: "Total",
  disch_berth: "3A",
  fixture: @wagon_fixture
)
cargo_count += 1

FixtureCargo.create!(
  name: "Brahma lager",
  obl: 3,
  quantity_mts: 4000,
  load_port: "Santos",
  load_terminal: "Petrobras",
  load_berth: "North-5",
  disch_port: "Le Havre",
  disch_terminal: "Total",
  disch_berth: "3A",
  fixture: @wagon_fixture
)


