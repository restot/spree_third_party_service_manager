module Spree
  class ThirdPartyService < Spree::Base

    ## CONSTANTS
    SCRIPT_MAX_LENGTH = 65535

    ## ASSOCIATIONS
    has_many :page_third_party_services
    has_many :pages, through: :page_third_party_services, dependent: :destroy

    ## VALIDATIONS
    with_options presence: true do
      validates :name, uniqueness: { case_sensitive: false }
      validates :script, length: { maximum: SCRIPT_MAX_LENGTH }
    end

    ## SCOPES
    scope :enabled, -> { where(enabled: true) }

    self.whitelisted_ransackable_attributes = %w[name enabled]

    def enable
      update(enabled: true)
    end

    def disable
      update(enabled: false)
    end
  end
end
