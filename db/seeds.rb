# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
puts "------------------------------------------------------------"
puts "seeding fixtures"
fixture_count = 0

20.times do
  vesname = ["Wagon Canard", "Wagon Macaw", "Wagon Eagle", "Wagon Razorbill", "Wagon Albatros", "Wagon Goose", "Wagon Hornbill", "Wagon Toucan"].sample
  charterer = ["Petrochem", "SPL", "Chemtrade", "Bahia tradecorp", "Shell", "Riofiber", "Samba Marine", "Dow", "BASF", "Unilever"].sample

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
    calculation_status: "validate"
    )
  fixture_count += 1
end

puts "succesfully seeded #{fixture_count} fixtures"
puts "#{Fixture.all.length} fixtures in database"
puts "------------------------------------------------------------"
puts "seeding clauses"

clause_count = 0

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Laydays",
    paragraph: "5",
    wording: "Laytime shall not commence before the date stipulated in Part I, except with the Charterer's sanction. Should the Vessel not be ready to load by 4:00 o'clock P.M. (local time) on the cancelling date stipulated in Part I, the Charterer shall have the option of cancelling this Charter by giving the Owner notice of such cancellation within twenty-four (24) hours after such cancellation date; otherwise this Charter to remain in full force and effect."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Notice of Readiness",
    paragraph: "6",
    wording: "Upon arrival at customary anchorage at each port of loading or discharge, the Master or his agent shall give the Charterer or his agent notice by letter, telegraph, wireless or telephone that the Vessel is ready to load or discharge cargo, berth or no berth, and laytime, as hereinafter provided, shall commence upon the expiration of six (6) hours after receipt of such notice, or upon the Vessel's arrival in berth (i.e. finished mooring when at a sealoading or discharging terminal and all fast when loading or discharging alongside a wharf), whichever first occur. However, where delay is caused to Vessel getting into berth after giving notice of readiness for any reason over which Charterer has no control, such delay shall not count as used laytime."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Hours for loading and discharging",
    paragraph: "7",
    wording: "The number of running hours specified as laytime in Part I shall be permitted the Charterer as laytime for loading and discharging cargo; but any delay due to the Vessel's condition or breakdown or inability of the Vessel's facilities to load or discharge cargo within the time allowed shall not count as used laytime. If regulations of the Owner or port authorities prohibit loading or discharging of the cargo at night, time so lost shall not count as used laytime; if the Charterer, shipper or consignee prohibits loading or discharging at night, time so lost shall count as used laytime. Time consumed by the vessel in moving from loading or discharge port anchorage to her loading or discharging berth, discharging ballast water or slops, will not count as used laytime."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Demurrage",
    paragraph: "8",
    wording: "Charterer shall pay demurrage per running hour and pro rata for a part thereof at the rate specified in Part I for all time that loading and discharging and used laytime as elsewhere herein provided exceeds the allowed laytime elsewhere herein specified. If, however, demurrage shall be incurred at ports of loading and / or discharge by reason of fire, explosion, storm or by a strike, lockout, stoppage or restraint of labor or by breakdown of machinery or equipment in or about the plant of the Charterer, supplier, shipper or consignee of the cargo, the rate of demurrage shall be reduced one-half of the amount stated in Part I per running hour or pro rata for part of an hour for demurrage so incurred. The Charterer shall not be liable for any demurrage for delay caused by strike, lockout, stoppage or restraint of labor for Master, officers and crew of the Vessel or tugboat or pilots."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Safe berthing-shifting",
    paragraph: "9",
    wording: "The Vessel shall load and discharge at any safe place or wharf, or alongside vessels or lighters reachable on her arrival, which shall be designated and procured by the Charterer, provided the Vessel can proceed thereto, lie at, and depart therefrom always safely afloat, any ligtherage being at the expense, risk and peril of the Charterer. The Charterer shall have the right of shifting the Vessel at ports of loading and / or discharge from one safe berth to another on payment of all towage and pilotage shifting to next berth, charges for running lines on arrival at and leaving that berth, additional agency charges and expenses, customs overtime and fees, and any other extra port charges or port expenses incurred by reason of using more than one berth. Time consumed on account of shifting shall count as used laytime except as otherwise provided in Clause 15."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Pumping in and out",
    paragraph: "10",
    wording: "The cargo shall be pumped into the Vessel at the expense, risk and peril of the Charterer, and shall be pumped out of the Vessel at the expense of the Vessel, but at the risk and peril only so far as the Vessel's permanent hose connections, where delivery of the cargo shall be taken by the Charterer or its consignee. If required by Charterer, Vessel after discharging is to clear shore pipe lines of cargo by pumping water through them and time consumed for this purpose shall apply against allowed laytime. The Vessel shall supply her pumps and the necessary power for discharging in all ports, as well as necessary hands. However, should the Vessel be prevented from supplying such power by reason of regulations prohibiting fires on board, the Charterer or consignee shall supply, at its expense, all power necessary for discharging as well as loading, but the Owner shall pay for power supplied to the Vessel for other purposes. If cargo is loaded from lighters, the Vessel shall furnish steam at Charterer's expense for pumping cargo into the Vessel, if requested by the Charterer, providing the Vessel has facilities for generating steam and is permitted to have fires on board. All overtime of officers and crew incurred in loading and / or discharging shall be for account of the Vessel."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Hoses: Moorning at sea terminals",
    paragraph: "11",
    wording: "Hoses for loading and discharging shall be furnished by the Charterer and shall be connected and disconnected by the Charterer, or, at the option of the Owner, by the Owner at the Charterer's risk and expense. Laytime shall continue until the hoses have been disconnected. When Vessel loads or discharges at a sea terminal, the Vessel shall be properly equipped at Owner's expense for loading or discharging at such place, including suitable ground tackle, mooring lines and equipment for handling submarine hoses."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "ICE",
    paragraph: "14(a)",
    wording: "In case port of loading or discharge should be inaccessible owing to ice, the Vessel shall direct her course according to Master's judgement, notifying by telegraph or radio, if available, the Charterers, shipper or consignee, who is bound to telegraph or radio orders for another port, which is free from ice and where there are facilities for the loading or reception of the cargo in bulk. The whole of the time occupied from the time the Vessel is diverted by reason of the ice until her arrival at an ice-free port of loading or discharge, as the case may be, shall be paid for by the Charterer at the demurrage rate stipulated in Part I."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "ICE",
    paragraph: "14(b)",
    wording: "If on account of ice the Master considers it dangerous to enter or remain at any loading or discharging place for fear of the Vessel being frozen in or damaged, the Master shall communicate by telegraph or radio, if available, with the Charterer, shipper or consignee of the cargo, who shall telegraph or radio him in reply, giving orders to proceed to another port as per Clause 14 (a) where there is no danger of ice and where there are the necessary facilities for the loading or reception of the cargo in bulk, or to remain at the original port at their risk, in either case Charterer to pay for the time that the Vessel may be delayed, at the demurrage rate stipulated in Part I."
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
              d) Time consumed shifting between berths within one of the ports or terminals of the particular grouping or combination shall count as used laytime."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Quarantine",
    paragraph: "17(a)",
    wording: "Should the Charterer send the Vessel to any port or place where a quarantine exists, any delay thereby caused to the Vessel shall count as used laytime; but should the quarantine not be declared until the Vessel is on passage to such port, the Charterer shall not be liable for any resulting delay."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Fumigation",
    paragraph: "17(b)",
    wording: "If the Vessel, prior to or after entering upon this Charter, has docked or docks at any wharf which is not rat-free or stegomyia-free, she shall, before proceeding to a rat-free or stegomyia-free wharf, be fumigated by the Owner at his expense, except that if the Charterer ordered the Vessel to an infected wharf the Charterer shall bear the expense of fumigation."
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
              - riot or civil commotion."
    )
  clause_count += 1
end

 1.times do
  Clause.create(
    cp_form: "Asbatankvoy",
    parent_relation: "standard",
    title: "Oil pollution clause",
    paragraph: "26",
    wording: "...part... The Charterer agrees to pay freight as per the terms of the Charter Party on any consolidated tank washings, dirty ballast, etc., retained on board on Charterer's instructions during the loaded portion of the voyage up to a maximum of 1% of the total deadweight of the vessel that could be legally carried for such voyage. Any extra expenses incurred by the vessel at loading or discharging port in pumping ashore oil residues shall be for Charterer's account, and extra time, if any, consumed for this operation shall count as used laytime."
    )
  clause_count += 1
end

puts "succesfully seeded #{clause_count} fixtures, should be: "
puts "#{Clause.all.length} fixtures in database"
puts "------------------------------------------------------------"

