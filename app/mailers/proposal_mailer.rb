class ProposalMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.proposal_mailer.created.subject
  #
  def created
    @proposal = params[:proposal]
    @sock = @proposal.proposed_sock
    @user = @sock.user
    @from_sock = @proposal.sock
    @from_user = @from_sock.user

    mail(
      subject: "You've received a match request for your sock - Socks Match",
      to: @user.email
    )
  end
end
