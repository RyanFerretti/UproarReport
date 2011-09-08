class Report < ActiveRecord::Base
  belongs_to :tour_date
  belongs_to :user

  has_many :pictures

  before_create :build_url_hash!
  after_create :create_associations!
  after_update { |r| r.start if r.not_started? }

  attr_accessible :description, :tour_date, :user

  validates_presence_of :tour_date, :user

  scope :for_company, lambda{|c_id| joins(:user).where("users.company_id = ?",c_id).order(:id) }
  scope :for_user, lambda{|u_id| where(:user_id => u_id) }
  scope :published, where(:state => :published)
  scope :recently_published, lambda {|num| where('published_at >= ?', Time.now - 1.week).limit(num) }

  state_machine :state, :initial => :not_started do
    event :start do
      transition :not_started => :in_progress
    end
    event :publish do
      transition :in_progress => :published
    end
    before_transition :on => :publish do |report|
      report.published_at = Time.now
    end
    after_transition :on => :publish do |report|
      if report.user.tour_rep?
        PublishedReportMailer.tour_report_published_email(report).deliver
      else
        PublishedReportMailer.company_report_published_email(report).deliver
      end
    end
    state :published do
      validates_presence_of :description 
    end
  end

  def full_name
    tour_date.full_name
  end

private

  def create_associations!
    #pictures.create!
  end

  def build_url_hash!
    self.public_url = UrlShortener.generate
  end
end
