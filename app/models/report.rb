class Report < ActiveRecord::Base
  belongs_to :tour_date
  belongs_to :company

  has_many :pictures

  before_create :build_url_hash!
  after_create :create_associations!
  after_update { |r| r.start if r.not_started? }

  attr_accessible :description, :tour_date, :company

  validates_presence_of :tour_date, :company

  scope :for_company, lambda{|c_id| where(:company_id => c_id) }

  state_machine :state, :initial => :not_started do
    event :start do
      transition :not_started => :in_progress
    end
    event :publish do
      transition :in_progress => :published
    end
    after_transition :on => :publish do |report|
      PublishedReportMailer.report_published_email(report).deliver
    end
    state :published do
      validates_presence_of :description 
    end
  end

private

  def create_associations!
    #pictures.create!
  end

  def build_url_hash!
    self.public_url = UrlShortener.generate
  end
end
