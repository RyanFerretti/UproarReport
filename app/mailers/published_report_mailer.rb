class PublishedReportMailer < ActionMailer::Base
  default :from => "from@example.com"
  def report_published_email(report)
    #groups = report.company.interested_parties
    
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
