class PublishedReportMailer < ActionMailer::Base
  default :from => "reports@rockstaruproar.com"

  def company_report_published_email(report)
    contacts = report.user.company.email_contacts
    unless contacts.empty?
      mail(:to => contacts.select{|c|!c.email.blank?}.map(&:email), :subject => report.tour_date.full_name)
    end
  end

  def tour_report_published_email(report)
    emails = User.where(:role => User::COMPANY_ADMIN).map(:email)
    contacts = EmailContact.where("email IS NOT NULL").map(:email)
    contacts = contacts.concat emails
    unless contacts.empty?
      mail(:to => contacts.select{|c|!c.blank?}, :subject => report.tour_date.full_name)
    end
  end
end
