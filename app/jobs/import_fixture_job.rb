class ImportFixtureJob < ApplicationJob
  queue_as :default

  def perform(file)
    return if (file.nil?)
    xlsx = Roo::Spreadsheet.open(file.path)

    fixture_sheet = xlsx.sheet(0).each(
      reference_no: "reference_no",
      charterer: "charterer",
      vessel_name: "vessel_name",
      voyage_number: "voyage_number",
      demurrage_rate: "demurrage_rate",
      allowed_laytime: "allowed_laytime",
      required_action: "action",
      days_until_completion: "eta",
      voyage_status: "status"
    )

    fixture_sheet.with_index(offset = 2) do |arguments, index|
      next if index == 0
      @fixture = Fixture.create(arguments)
    end

    fixture_cargo_sheet = xlsx.sheet(1).each(
      name: "name",
      quantity_mts: "qty_mts",
      load_port: "load_port",
      load_terminal: "load_terminal",
      load_berth: "load_berth",
      disch_port: "disch_port",
      disch_terminal: "disch_terminal",
      disch_berth: "disch_berth",
      obl: "obl"
    )

    # stragely enough I the offset did not work in the below so I
    # set offset at 0 and skipped the first with the conditional
    fixture_cargo_sheet.with_index(offset = 0) do |arguments, index|
      next if index == 0
      arguments[:fixture] = @fixture
      cargo = FixtureCargo.create(arguments)
    end

    return @fixture
  end
end
