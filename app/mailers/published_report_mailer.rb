class PublishedReportMailer < ActionMailer::Base
  default :from => "Uproar Reports <reports@rockstaruproar.com>"

  def company_report_published_email(report)
    @report = report
    @company_id = report.user.company_id
    contacts = report.user.company.email_contacts.select{|c|!c.email.blank?}.map(&:email)
    contacts << report.user.company.admin.email
    mail(:to => contacts, :subject => "Uproar #{report.tour_date.full_name}", :template_name => 'report_published_email')
  end

  def tour_report_published_email(report,company,contacts)
    @report = report
    @company_id = company.id
    mail(:to => contacts, :subject => "Uproar #{@report.tour_date.full_name}", :template_name => 'report_published_email')
  end
end
