class PublishedReportMailer < ActionMailer::Base
  default :from => "reports@rockstaruproar.com"

  def company_report_published_email(report)
    contacts = report.user.company.email_contacts.select{|c|!c.email.blank?}.map(&:email)
    contacts << report.user.company.admin.email
    mail(:to => contacts, :subject => report.tour_date.full_name)
  end

  def tour_report_published_email(r)
    @report = r
    emails = {}

    Company.all.each{|c|emails[c.id]=[]}
    User.where(:role => User::COMPANY_ADMIN).each{|u| emails[u.company_id] << u.email}
    EmailContact.where("email IS NOT NULL").each{|c| emails[c.company_id] << c.email}

    emails.keys.each do |k|
      @company_id = k
      mail(:to => emails[k].select{|c|!c.blank?}, :subject => @report.tour_date.full_name)
    end
  end
end
