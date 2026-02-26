class CreatesProposal < ApplicationService
  attr_reader :sock_id, :proposed_sock_id

  def call
    proposal = Proposal.new(sock_id: sock_id, proposed_sock_id: proposed_sock_id)
    # Save the proposed match to the database
    proposal.save!

    ProposalMailer.with(proposal: proposal).created.deliver_later
    proposal
  end
end
