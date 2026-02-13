class DashboardController < ApplicationController
  def welcome
    @socks = Sock.all
    @proposals = Proposal.joins(:proposed_sock).where(socks: { owner: current_user })
  end
end
