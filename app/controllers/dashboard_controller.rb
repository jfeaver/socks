class DashboardController < ApplicationController
  def welcome
    @socks = Sock.all
    @proposals = Proposal.to_owner(current_user)
  end
end
