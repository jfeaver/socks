require "rails_helper"

RSpec.describe AcceptsProposal do
  let(:user) { create(:user) }
  let(:proposal) { create(:proposal, proposed_sock: create(:sock, owner: user)) }

  describe '#call' do
    it 'accepts the proposal and creates a match' do
      expect {
        described_class.call(for_user: user, proposal_id: proposal.id)
      }.to change(Match, :count).by(1)

      expect(proposal.reload.accepted_at).not_to be_nil
    end

    it 'raises an error if the proposal is not found or not sent to the user' do
      expect {
        described_class.call(for_user: user, proposal_id: -1)
      }.to raise_error(ActiveRecord::RecordNotFound)

      other_user = create(:user)
      expect {
        described_class.call(for_user: other_user, proposal_id: proposal.id)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
