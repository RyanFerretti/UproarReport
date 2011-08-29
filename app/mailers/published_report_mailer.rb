class PublishedReportMailer < ActionMailer::Base
  default :from => "reports@rockstaruproar.com"
  def report_published_email(report)
    contacts = report.company.email_contacts
    unless contacts.empty?
      mail(:to => contacts.map(&:email), :subject => report.tour_date.full_name)
    end
  end
end
