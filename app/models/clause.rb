class Clause < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_cp_form_and_paragraph_and_wording,
                  against: [ :cp_form, :paragraph, :wording ],
                  using: {
                    tsearch: { prefix: true }
                  }

  def bloc_call(event, terminal_events)
    @proc_service = ProcService.new(self)
    @proc_service.call(event, terminal_events)
  end
end
